#!/usr/bin/env python3
import argparse
import csv
import json
import pathlib
import re
import shlex
import subprocess
import time


def run_command(cmd, cwd=None):
    proc = subprocess.run(
        cmd,
        cwd=cwd,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    return proc.returncode, proc.stdout


def parse_cuszp_output(text):
    result = {}
    patterns = {
        "compress_gbps": r"compression\s+end-to-end speed:\s+([0-9.]+)\s+GB/s",
        "decompress_gbps": r"decompression\s+end-to-end speed:\s+([0-9.]+)\s+GB/s",
        "compression_ratio": r"compression ratio:\s+([0-9.]+)"
    }
    for key, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            result[key] = float(match.group(1))
    return result


def parse_fzgpu_output(text):
    result = {}
    patterns = {
        "compress_gbps": r"compression e2e throughput:\s+([0-9.]+)\s+GB/s",
        "decompress_gbps": r"decompression e2e throughput:\s+([0-9.]+)\s+GB/s",
        "compression_ratio": r"compression ratio:\s+([0-9.]+)",
        "compressed_size_bytes": r"compressed size:\s+([0-9]+)",
        "compression_time_sec": r"compression time:\s+([0-9.eE+-]+)\s+s",
        "decompression_time_sec": r"decompression time:\s+([0-9.eE+-]+)\s+s"
    }
    for key, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            value = match.group(1)
            result[key] = float(value) if "." in value or "e" in value.lower() else int(value)
    return result


def build_cuszp_command(binary, dataset, eb, encoding_mode):
    dims = dataset["dims"]
    dim_mode = dataset["dim_mode"]
    cmd = [
        binary,
        "-i", dataset["path"],
        "-t", dataset["dtype"],
        "-m", encoding_mode,
        "-d", str(dim_mode),
    ]
    if dim_mode in (2, 3):
        cmd.extend([str(dims[0]), str(dims[1]), str(dims[2])])
    cmd.extend(["-eb", eb["mode"], eb["value"]])
    return cmd


def build_fzgpu_command(binary, dataset, eb):
    dims = dataset["dims"]
    dim_x = dims[2] if len(dims) > 2 else 1
    dim_y = dims[1] if len(dims) > 1 else 1
    dim_z = dims[0] if len(dims) > 0 else 1
    return [
        binary,
        dataset["path"],
        str(dim_x),
        str(dim_y),
        str(dim_z),
        eb["value"],
    ]


def build_placeholder_command(binary):
    return [binary, "--help"]


def maybe_profile(ncu_path, sections, report_base, cmd):
    profile_cmd = [ncu_path, "--target-processes", "all", "--csv"]
    for section in sections:
        profile_cmd.extend(["--section", section])
    profile_cmd.extend(["--export", str(report_base)])
    profile_cmd.extend(cmd)
    return run_command(profile_cmd)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", required=True)
    parser.add_argument("--output-root", required=True)
    parser.add_argument("--ncu", default="ncu")
    args = parser.parse_args()

    with open(args.config) as f:
        cfg = json.load(f)

    output_root = pathlib.Path(args.output_root)
    output_root.mkdir(parents=True, exist_ok=True)
    raw_root = output_root / "raw"
    raw_root.mkdir(parents=True, exist_ok=True)
    results_csv = output_root / "results.csv"

    rows = []
    for dataset in cfg["datasets"]:
        for compressor in cfg["compressors"]:
            if not compressor.get("enabled", False):
                continue
            binary = compressor["binary"]
            for eb in cfg["error_bounds"]:
                commands = []
                if compressor["name"] == "cuszp":
                    for mode in compressor.get("encoding_modes", ["plain"]):
                        commands.append((f"cuszp_{mode}", build_cuszp_command(binary, dataset, eb, mode)))
                elif compressor["name"] == "fzgpu":
                    commands.append(("fzgpu", build_fzgpu_command(binary, dataset, eb)))
                else:
                    commands.append((compressor["name"], build_placeholder_command(binary)))

                for label, cmd in commands:
                    for trial in range(cfg["repetitions"]["warmup"] + cfg["repetitions"]["timed"]):
                        timed = trial >= cfg["repetitions"]["warmup"]
                        started = time.time()
                        code, output = run_command(cmd)
                        elapsed = time.time() - started
                        raw_name = f"{dataset['name']}__{label}__{eb['mode']}_{eb['value']}__trial{trial}.log"
                        (raw_root / raw_name).write_text(output)

                        metrics = {}
                        if compressor["name"] == "cuszp":
                            metrics = parse_cuszp_output(output)
                        elif compressor["name"] == "fzgpu":
                            metrics = parse_fzgpu_output(output)

                        row = {
                            "dataset": dataset["name"],
                            "compressor": compressor["name"],
                            "label": label,
                            "error_mode": eb["mode"],
                            "error_value": eb["value"],
                            "trial": trial,
                            "timed_trial": timed,
                            "return_code": code,
                            "elapsed_sec": elapsed,
                            "command": shlex.join(cmd),
                            "raw_log": str(raw_root / raw_name),
                            "compress_gbps": metrics.get("compress_gbps", ""),
                            "decompress_gbps": metrics.get("decompress_gbps", ""),
                            "compression_ratio": metrics.get("compression_ratio", ""),
                            "compressed_size_bytes": metrics.get("compressed_size_bytes", ""),
                            "compression_time_sec": metrics.get("compression_time_sec", ""),
                            "decompression_time_sec": metrics.get("decompression_time_sec", "")
                        }

                        if timed and cfg["profiling"]["enable_ncu"]:
                            report_base = raw_root / raw_name.replace(".log", "")
                            ncu_code, ncu_output = maybe_profile(
                                args.ncu,
                                cfg["profiling"]["ncu_sections"],
                                report_base,
                                cmd,
                            )
                            ncu_log = raw_root / raw_name.replace(".log", ".ncu.log")
                            ncu_log.write_text(ncu_output)
                            row["ncu_return_code"] = ncu_code
                            row["ncu_report_base"] = str(report_base)
                            row["ncu_log"] = str(ncu_log)

                        rows.append(row)

    fieldnames = sorted({key for row in rows for key in row.keys()})
    with open(results_csv, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} rows to {results_csv}")


if __name__ == "__main__":
    main()

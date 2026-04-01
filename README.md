# GPU Compression Performance

This repository is a measurement-first study of GPU-based scientific lossy compressors on an NVIDIA RTX 6000 Ada workstation. The immediate goal is to produce a reproducible roofline-oriented benchmark harness for `cuSZ`, `cuSZp`, `FZ-GPU`, `zfp` CUDA, and `MGARD`, then use the resulting traces to decide whether a stronger research project should follow.

The project is intentionally structured around the Dr. Claw pipeline:

- `Survey/reports/` contains the initial literature-backed experiment framing.
- `Experiment/analysis/` contains the concrete experimental protocol.
- `Experiment/core_code/` contains scripts and configs to install compressors and collect benchmark data.

## What is in scope

- Install representative open-source GPU scientific lossy compressors on the workstation.
- Measure compression/decompression throughput and compression ratio.
- Collect Nsight Compute data for roofline, occupancy, memory workload, and kernel breakdown.
- Normalize results into CSV/JSON artifacts for later plotting and runtime-model development.

## What is not done yet

- The workstation runs have not been executed from this environment.
- The external Hurricane dataset path supplied by the user is referenced in configs but was not inspected here.
- A GitHub remote is not configured yet. Once you share the target repo URL, this directory can be initialized and pushed.

## Quick start on the workstation

```bash
cd Experiment/core_code
bash scripts/install_compressors.sh --prefix "$PWD/../deps" --cuda-arch 89
python3 scripts/benchmark_driver.py \
  --config configs/benchmark_matrix.example.json \
  --output-root ../analysis/results \
  --ncu /usr/local/cuda/bin/ncu
```

Update the dataset paths, dimensions, and compressor binary locations in `configs/benchmark_matrix.example.json` before running.

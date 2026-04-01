# Roofline-Oriented Experiment Plan

## Objective

Establish whether representative GPU scientific lossy compressors on an RTX 6000 Ada are primarily compute-bound, memory-bound, or limited by other effects such as launch structure, synchronization, or low occupancy. The immediate outcome is a reproducible characterization suite, not yet a finalized predictive model.

## Target hardware

- GPU: NVIDIA RTX 6000 Ada
- CUDA architecture target for builds: `89`
- Profilers: `Nsight Compute` for roofline and kernel metrics; `Nsight Systems` is optional for timeline sanity checks

## Dataset plan

### Primary dataset

- User-supplied climate dataset on the workstation:
  `/home/jwang96/datasets/Hurricane_new/clean-data-Jinyang`

This path is intentionally referenced but was not inspected from this repository environment.

### Supplemental datasets

Use additional SDRBench-style datasets only if they are available on the workstation or are later mirrored into the project:

- `CESM`
- `NYX`
- `HACC`
- `EXAALT`

## Compressor set

### Required

- `cuSZ`
- `cuSZp`
- `FZ-GPU`
- `zfp` with CUDA enabled

### Strongly recommended

- `MGARD-X` or legacy `MGARD-GPU`, depending on what builds cleanly on the workstation

### Optional follow-up

- Variants bundled within the `cuSZ` ecosystem if they are stable to build and separately executable

## Metrics to collect

### End-to-end

- Compression throughput in GB/s
- Decompression throughput in GB/s
- Compression ratio
- Compressed size in bytes
- Wall-clock runtime per trial

### Hardware utilization and roofline

- Arithmetic intensity
- Achieved memory bandwidth
- Achieved FLOP rate, if reported cleanly by Nsight Compute
- Roofline section outputs from `SpeedOfLight_RooflineChart`
- SM occupancy from `Occupancy`
- Launch statistics from `LaunchStats`
- Memory pipeline data from `MemoryWorkloadAnalysis`

### Kernel breakdown

- Kernel names
- Per-kernel duration
- Percentage of total runtime per kernel
- Per-kernel arithmetic intensity and roofline placement when available

### Additional recommended metrics

- Repetition-to-repetition variance
- Warm versus steady-state timing difference
- Input size in bytes and element count
- Data type and dimensionality metadata
- Error-bound mode and value
- Compressor-specific mode (for example `plain`, `outlier`, or `fixed`)

## Control variables

- Precision: `f32` first, `f64` if supported and relevant
- Error-bound mode: relative and absolute where the compressor supports both
- Error-bound values: begin with `1e-2`, `1e-3`, `1e-4`, then adjust
- Shape metadata: preserve true dimensions when known; compare against flattened 1D mode where useful
- Repetitions: at least 5 steady-state runs after 1-2 warm-up runs

## Experimental matrix

Start small and expand only after functionality is verified.

### Phase 0: bring-up

- One dataset
- One shape
- One precision
- One error bound
- All compressors

Goal: validate builds, file formats, and logging.

### Phase 1: throughput and ratio sweep

- One climate dataset family
- `f32`
- 3-4 error bounds
- All compressors and exposed modes

Goal: identify obvious performance and ratio regimes.

### Phase 2: roofline sweep

- Same matrix as Phase 1, but with `ncu` collection
- Profile at least one representative run per compressor-mode combination

Goal: attribute throughput limits to compute, memory, or overhead.

### Phase 3: sensitivity sweep

- Add shape and size variation
- Add one or more supplemental datasets
- Add `f64` where meaningful

Goal: determine whether roofline behavior is stable enough for later predictive modeling.

## Nsight Compute collection plan

Use these sections first:

- `SpeedOfLight_RooflineChart`
- `LaunchStats`
- `Occupancy`
- `MemoryWorkloadAnalysis`

Recommended command pattern:

```bash
ncu --target-processes all \
  --csv \
  --section SpeedOfLight_RooflineChart \
  --section LaunchStats \
  --section Occupancy \
  --section MemoryWorkloadAnalysis \
  --export <report-base> \
  <compressor command ...>
```

If profiler overhead is high, collect timing-only runs and profile a reduced subset.

## Analysis questions

1. Does each compressor cluster in a stable roofline region across error bounds?
2. Do fused designs such as `cuSZp` trade arithmetic intensity for lower launch overhead?
3. Does `FZ-GPU` occupy a distinct speed/ratio regime relative to `cuSZ` and `cuSZp` on Ada GPUs?
4. Are compression and decompression bottlenecks symmetric?
5. Which metrics appear stable enough to become features for later runtime prediction?

## Threats to validity

- CLI-based measurements may include file-I/O effects if not isolated.
- Some compressors support different dimensional modes; comparisons must preserve semantic fairness.
- GPU clocks, thermals, and background activity can distort roofline interpretation.
- Not all compressors expose identical error semantics.

## Deliverables from the first workstation run

- Successful build log for each compressor
- A `results.csv` file with timing and ratio summaries
- One Nsight Compute export per compressor for the baseline case
- One preliminary roofline plot per compressor
- A short note on whether the project looks promising enough to proceed

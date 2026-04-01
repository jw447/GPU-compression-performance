# GPU Lossy Compression Survey and Initial Positioning

## Scope

This survey is limited to open-source, GPU-capable scientific lossy compressors that are realistic candidates for workstation-side benchmarking under a single methodology. The starting set is `cuSZ`, `cuSZp`, `FZ-GPU`, `zfp` with CUDA support, and `MGARD`/`MGARD-X`.

## Why this project may amount to something

The empirical gap is not whether GPU lossy compression can be fast; the literature already establishes that. The open question is whether a unified roofline-style analysis on a modern Ada GPU can separate compressors into stable performance regimes that are useful for online selection. If the results show clear and repeatable relationships between dataset/compressor features and bottlenecks, the project can grow into a runtime-prediction paper. If not, the negative result is still valuable as a carefully measured characterization.

## Baseline compressor landscape

### cuSZ

- `cuSZ` is the GPU implementation of SZ and explicitly frames itself as a GPU-practical error-bounded scientific lossy compressor.
- Its public README cites the foundational papers for the base framework (`PACT 2020`), throughput/compression-ratio optimizations (`CLUSTER 2021`), and later interpolation-heavy variants (`SC 2024`).
- The algorithmic structure is multi-stage: prediction and quantization, statistics/histogram, and Huffman-oriented lossless encoding. That structure makes it a good candidate for kernel-level roofline decomposition rather than only end-to-end timing.

### cuSZp

- `cuSZp` is positioned for ultra-fast end-to-end throughput and states that the full compression/decompression phase is fused into a single CUDA kernel.
- Its public documentation and README emphasize end-to-end bandwidth numbers and encoding modes (`fixed`, `plain`, `outlier`), which makes it especially useful for comparing fused-kernel designs against multi-kernel designs such as `cuSZ`.
- Because it exposes both device-pointer APIs and a CLI, it fits the planned harness without invasive code changes.

### FZ-GPU

- `FZ-GPU` is implemented on top of the `cuSZ` framework but changes the quantization path and introduces fused kernels around bitshuffle and a new lossless encoding path.
- Its README cites the `HPDC 2023` paper and reports end-to-end throughput, ratio, and kernel names that are directly relevant to the planned kernel-breakdown analysis.
- Relative to `cuSZp`, it is useful because it is also fusion-oriented but is explicitly designed for high ratio as well as speed, giving the study another SZ-family point in the design space.

### zfp

- `zfp` is a long-lived scientific compressor from LLNL with CUDA support for whole-array compression.
- Its foundational literature emphasizes transform/block coding and error modes rather than GPU throughput as the primary contribution.
- Within this project, `zfp` matters because it offers a substantially different algorithmic structure from SZ-family compressors, which should help test whether roofline signatures can distinguish compressor families.

### MGARD / MGARD-X

- `MGARD` represents multigrid-style refactoring rather than predictor-plus-entropy coding.
- The project’s README lists GPU acceleration papers, including the `IPDPS 2021` work on accelerating multigrid-based refactoring on GPUs.
- Including `MGARD` broadens the study beyond SZ-family designs and may reveal whether memory- versus compute-dominance tracks algorithm family.

## Measurement gaps worth testing

1. Existing papers usually optimize one compressor in isolation; they do not normalize roofline position under a shared workstation protocol.
2. End-to-end throughput claims often mix compression logic with launch overhead and data movement, making bottleneck attribution unclear.
3. Fused or partially fused SZ-family designs (`cuSZp`, `FZ-GPU`) and staged designs (`cuSZ`) likely produce different occupancy and bandwidth signatures, but the practical consequence on Ada GPUs is not yet established here.
4. Later runtime-model work needs a stable feature set; the benchmark campaign should reveal whether arithmetic intensity, occupancy, or dataset smoothness proxies have predictive value.

## Initial experiment implications

- Measure both end-to-end and per-kernel behavior.
- Keep data movement policy explicit. A device-resident benchmark is not interchangeable with a file-driven CLI benchmark.
- Normalize all throughput values using uncompressed input bytes and report decompression separately.
- Save raw profiler exports, not only plotted points, so the later modeling work can reuse them.

## Primary sources

- cuSZ repository: https://github.com/szcompressor/cuSZ
- cuSZ paper (`PACT 2020`): https://arxiv.org/abs/2007.09625
- cuSZ+ paper (`CLUSTER 2021`): https://arxiv.org/abs/2105.12912
- cuSZ-i paper (`SC 2024`): https://arxiv.org/abs/2312.05492
- cuSZp repository: https://github.com/szcompressor/cuSZp
- FZ-GPU repository: https://github.com/szcompressor/FZ-GPU
- FZ-GPU paper (`HPDC 2023`): https://arxiv.org/abs/2304.12557
- zfp repository: https://github.com/LLNL/zfp
- zfp foundational paper: https://doi.org/10.1109/TVCG.2014.2346458
- zfp error analysis paper: https://doi.org/10.1137/18M1168832
- MGARD repository: https://github.com/CODARcode/MGARD
- MGARD GPU acceleration paper: https://arxiv.org/abs/2105.12764
- NVIDIA Nsight Compute Profiling Guide: https://docs.nvidia.com/nsight-compute/ProfilingGuide/index.html

/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/CompressionLowLevel/Compressor.hpp"

// clang-format off
namespace mgard_x {

template class Compressor<4, double, CUDA>;

template class CompressorCache<4, double, CUDA, Compressor<4, double, CUDA>>;

} // namespace mgard_x
// clang-format on

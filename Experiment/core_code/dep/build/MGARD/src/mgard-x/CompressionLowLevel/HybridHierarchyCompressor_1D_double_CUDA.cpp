/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/CompressionLowLevel/HybridHierarchyCompressor.hpp"
// clang-format off
namespace mgard_x {

template class HybridHierarchyCompressor<1, double, CUDA>;
template class CompressorCache<1, double, CUDA, HybridHierarchyCompressor<1, double, CUDA>>;

} // namespace mgard_x
// clang-format on

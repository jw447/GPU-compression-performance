/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/CompressionLowLevel/Compressor.hpp"

// clang-format off
namespace mgard_x {

template class Compressor<2, float, SERIAL>;

template class CompressorCache<2, float, SERIAL, Compressor<2, float, SERIAL>>;

} // namespace mgard_x
// clang-format on

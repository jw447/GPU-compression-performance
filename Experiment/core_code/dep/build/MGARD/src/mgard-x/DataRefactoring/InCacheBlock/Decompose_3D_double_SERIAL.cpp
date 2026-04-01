/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/DataRefactoring/InCacheBlock/DataRefactoring.hpp"
// clang-format off
namespace mgard_x {

namespace data_refactoring {

namespace in_cache_block {

template void decompose<3, double, SERIAL>(
    SubArray<3, double, SERIAL> v, 
    SubArray<3, double, SERIAL> coarse, 
    SubArray<1, double, SERIAL> coeff, int queue_idx);
} // namespace in_cache_block

} // namespace data_refactoring

} // namespace mgard_x// clang-format on


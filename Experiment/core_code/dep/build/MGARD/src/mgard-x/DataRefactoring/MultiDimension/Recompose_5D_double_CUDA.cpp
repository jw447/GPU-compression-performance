/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/DataRefactoring/MultiDimension/DataRefactoring.hpp"
// clang-format off
namespace mgard_x {

namespace data_refactoring {

namespace multi_dimension {

template void recompose<5, double, CUDA>(
    Hierarchy<5, double, CUDA> &hierarchy,
    SubArray<5, double, CUDA> &v,
    SubArray<5, double, CUDA> w,
    SubArray<5, double, CUDA> b, 
    int start_level, int stop_level, int queue_idx);

} // namespace multi_dimension

} // namespace data_refactoring

} // namespace mgard_x// clang-format on

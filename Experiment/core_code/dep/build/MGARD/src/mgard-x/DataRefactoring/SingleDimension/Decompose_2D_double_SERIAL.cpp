/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/DataRefactoring/SingleDimension/DataRefactoring.hpp"
// clang-format off
namespace mgard_x {

namespace data_refactoring {

namespace single_dimension {

template void decompose<2, double, SERIAL>(
    Hierarchy<2, double, SERIAL> &hierarchy,
    SubArray<2, double, SERIAL> &v, int start_level, int stop_level,
    int queue_idx);

} // namespace single_dimension

} // namespace data_refactoring

} // namespace mgard_x
// clang-format on

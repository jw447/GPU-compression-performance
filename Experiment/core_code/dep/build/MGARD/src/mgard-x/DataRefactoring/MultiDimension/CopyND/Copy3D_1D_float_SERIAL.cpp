/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/DataRefactoring/MultiDimension/CopyND/Copy3D.hpp"
// clang-format off
namespace mgard_x {

namespace data_refactoring {

namespace multi_dimension {

template void Copy3D<1, float, SERIAL>(
    SubArray<1, float, SERIAL> dinput,
    SubArray<1, float, SERIAL> doutput, bool padding, int queue_idx);

} // namespace multi_dimension

} // namespace data_refactoring

} // namespace mgard_x
// clang-format on

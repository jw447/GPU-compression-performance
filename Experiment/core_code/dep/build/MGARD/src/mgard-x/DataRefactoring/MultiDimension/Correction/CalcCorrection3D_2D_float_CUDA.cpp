/*
 * Copyright 2022, Oak Ridge National Laboratory.
 * MGARD-X: MultiGrid Adaptive Reduction of Data Portable across GPUs and CPUs
 * Author: Jieyang Chen (chenj3@ornl.gov)
 * Date: March 17, 2022
 */

#include "mgard-x/DataRefactoring/MultiDimension/Correction/CalcCorrection3D.hpp"
// clang-format off
namespace mgard_x {

namespace data_refactoring {

namespace multi_dimension {

template void CalcCorrection3D<2, float, CUDA>(
    Hierarchy<2, float, CUDA> &hierarchy,
    SubArray<2, float, CUDA> dcoeff,
    SubArray<2, float, CUDA> &dcorrection, SIZE l,
    int queue_idx);

} // namespace multi_dimension

} // namespace data_refactoring

} // namespace mgard_x
// clang-format on

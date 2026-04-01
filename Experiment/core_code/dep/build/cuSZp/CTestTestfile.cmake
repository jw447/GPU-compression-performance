# CMake generated Testfile for 
# Source directory: /home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp
# Build directory: /home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[cuSZpTest_f32_1D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f32_1D")
set_tests_properties([=[cuSZpTest_f32_1D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;102;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
add_test([=[cuSZpTest_f32_2D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f32_2D")
set_tests_properties([=[cuSZpTest_f32_2D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;103;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
add_test([=[cuSZpTest_f32_3D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f32_3D")
set_tests_properties([=[cuSZpTest_f32_3D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;104;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
add_test([=[cuSZpTest_f64_1D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f64_1D")
set_tests_properties([=[cuSZpTest_f64_1D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;105;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
add_test([=[cuSZpTest_f64_2D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f64_2D")
set_tests_properties([=[cuSZpTest_f64_2D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;106;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
add_test([=[cuSZpTest_f64_3D]=] "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin/cuSZp_test_f64_3D")
set_tests_properties([=[cuSZpTest_f64_3D]=] PROPERTIES  WORKING_DIRECTORY "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp/bin" _BACKTRACE_TRIPLES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;107;add_test;/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/CMakeLists.txt;0;")
subdirs("examples")

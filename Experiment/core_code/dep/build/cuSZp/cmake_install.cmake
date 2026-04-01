# Install script for directory: /home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/install/cuSZp")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/examples/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cuSZp" TYPE FILE FILES
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_1D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_1D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_2D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_2D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_3D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_entry_3D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_1D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_1D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_2D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_2D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_3D_f32.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_kernels_3D_f64.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_timer.h"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/third_party/cuSZp/include/cuSZp/cuSZp_utility.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/libcuSZp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcuSZp.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/libcuSZp.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/cuSZpTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/cuSZpTargets.cmake"
         "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/cuSZpTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/cuSZpTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/cuSZpTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/cuSZpTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/cuSZpTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/cuSZpConfig.cmake"
    "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/cuSZpConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jwang96/GPU-compression-performance/Experiment/core_code/dep/build/cuSZp/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")

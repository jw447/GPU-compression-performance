#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "PHF::phf_cu" for configuration "Release"
set_property(TARGET PHF::phf_cu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(PHF::phf_cu PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libphf_cu.so"
  IMPORTED_SONAME_RELEASE "libphf_cu.so"
  )

list(APPEND _cmake_import_check_targets PHF::phf_cu )
list(APPEND _cmake_import_check_files_for_PHF::phf_cu "${_IMPORT_PREFIX}/lib/libphf_cu.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

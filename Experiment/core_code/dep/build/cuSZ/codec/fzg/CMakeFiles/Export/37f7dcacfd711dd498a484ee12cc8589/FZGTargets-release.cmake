#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FZG::fzg_cu" for configuration "Release"
set_property(TARGET FZG::fzg_cu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FZG::fzg_cu PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libfzg_cu.so"
  IMPORTED_SONAME_RELEASE "libfzg_cu.so"
  )

list(APPEND _cmake_import_check_targets FZG::fzg_cu )
list(APPEND _cmake_import_check_files_for_FZG::fzg_cu "${_IMPORT_PREFIX}/lib/libfzg_cu.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

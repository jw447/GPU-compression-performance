#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CUSZ::psz_seq_core" for configuration "Release"
set_property(TARGET CUSZ::psz_seq_core APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::psz_seq_core PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpsz_seq_core.so"
  IMPORTED_SONAME_RELEASE "libpsz_seq_core.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::psz_seq_core )
list(APPEND _cmake_import_check_files_for_CUSZ::psz_seq_core "${_IMPORT_PREFIX}/lib/libpsz_seq_core.so" )

# Import target "CUSZ::psz_cu_core" for configuration "Release"
set_property(TARGET CUSZ::psz_cu_core APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::psz_cu_core PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpsz_cu_core.so"
  IMPORTED_SONAME_RELEASE "libpsz_cu_core.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::psz_cu_core )
list(APPEND _cmake_import_check_files_for_CUSZ::psz_cu_core "${_IMPORT_PREFIX}/lib/libpsz_cu_core.so" )

# Import target "CUSZ::psz_cu_stat" for configuration "Release"
set_property(TARGET CUSZ::psz_cu_stat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::psz_cu_stat PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpsz_cu_stat.so"
  IMPORTED_SONAME_RELEASE "libpsz_cu_stat.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::psz_cu_stat )
list(APPEND _cmake_import_check_files_for_CUSZ::psz_cu_stat "${_IMPORT_PREFIX}/lib/libpsz_cu_stat.so" )

# Import target "CUSZ::psz_cu_mem" for configuration "Release"
set_property(TARGET CUSZ::psz_cu_mem APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::psz_cu_mem PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpsz_cu_mem.so"
  IMPORTED_SONAME_RELEASE "libpsz_cu_mem.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::psz_cu_mem )
list(APPEND _cmake_import_check_files_for_CUSZ::psz_cu_mem "${_IMPORT_PREFIX}/lib/libpsz_cu_mem.so" )

# Import target "CUSZ::psz_cu_utils" for configuration "Release"
set_property(TARGET CUSZ::psz_cu_utils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::psz_cu_utils PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpsz_cu_utils.so"
  IMPORTED_SONAME_RELEASE "libpsz_cu_utils.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::psz_cu_utils )
list(APPEND _cmake_import_check_files_for_CUSZ::psz_cu_utils "${_IMPORT_PREFIX}/lib/libpsz_cu_utils.so" )

# Import target "CUSZ::cusz" for configuration "Release"
set_property(TARGET CUSZ::cusz APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CUSZ::cusz PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcusz.so"
  IMPORTED_SONAME_RELEASE "libcusz.so"
  )

list(APPEND _cmake_import_check_targets CUSZ::cusz )
list(APPEND _cmake_import_check_files_for_CUSZ::cusz "${_IMPORT_PREFIX}/lib/libcusz.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

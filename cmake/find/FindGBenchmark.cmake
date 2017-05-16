# Copyright (c) 2015-2016, University College London
# All rights reserved.

# Defines the following variables
#
# - GBENCHMARK_FOUND if the library is found
# - GBENCHMARK_LIBRARY is the path to the library
# - GBENCHMARK_INCLUDE_DIR is the path to the include directory
if(NOT GBENCHMARK_FOUND)
  find_library(GBENCHMARK_LIBRARY benchmark DOC "Path to the google benchmark library")
  find_path(
      GBENCHMARK_INCLUDE_DIR benchmark/benchmark.h
      DOC "Path to google benchmark include directory"
      PATHS "${casapath}"
  )

  include(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(
      GBENCHMARK
      REQUIRED_VARS GBENCHMARK_LIBRARY GBENCHMARK_INCLUDE_DIR
  )
endif()

if(GBENCHMARK_FOUND)
  if(GBENCHMARK_LIBRARY MATCHES "\\.a$")
    add_library(gbenchmark STATIC IMPORTED GLOBAL)
  else()
    add_library(gbenchmark SHARED IMPORTED GLOBAL)
  endif()
  set_target_properties(gbenchmark PROPERTIES
      IMPORTED_LOCATION "${GBENCHMARK_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${GBENCHMARK_INCLUDE_DIR}"
  )
endif()

# ----------------------------------------------------------------------
# Findodb.cmake - odb CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# Exports targets "giflib" for the giflib library
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("GIFLIB_ROOT: ${GIFLIB_ROOT}")

find_path(
    GIFLIB_INCLUDE_DIR
    gif_lib.h
    PATHS
      "${GIFLIB_ROOT}/include"
    NO_DEFAULT_PATH
)

# Find GIFLIB C++ library:
find_library(
    GIFLIB_LIBRARY
    libgif gif giflib
    PATHS
      "${GIFLIB_ROOT}/lib"
    NO_DEFAULT_PATH
)

hunter_status_debug("GIFLIB_LIBRARY: ${GIFLIB_LIBRARY}")

if(NOT TARGET "giflib")
  if(NOT GIFLIB_LIBRARY)
    message(FATAL_ERROR "GIFLIB_LIBRARY not found!")
  endif()
  add_library("giflib" UNKNOWN IMPORTED)
  set_target_properties(
      "giflib"
      PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${GIFLIB_INCLUDE_DIR}"
        IMPORTED_LOCATION "${GIFLIB_LIBRARY}"
  )
  get_filename_component(GIFLIB_LIB_DIR "${GIFLIB_LIBRARY}" DIRECTORY CACHE)
  hunter_status_debug("GIFLIB_LIB_DIR: ${ODB_LIB_DIR}")
  set(GIFLIB_FOUND TRUE)
endif()

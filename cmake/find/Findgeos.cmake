# ----------------------------------------------------------------------
# Findodb.cmake - odb CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# Exports targets "geos" and "geos::c" for the geos library
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("GEOS_ROOT: ${GEOS_ROOT}")

find_path(
    GEOS_INCLUDE_DIR
    geos/geom/Geometry.h
    PATHS
      "${GEOS_ROOT}/include"
    NO_DEFAULT_PATH
)

# Find GEOS C++ library:
find_library(
    GEOS_LIBRARY
    geos
    PATHS
      "${GEOS_ROOT}/lib"
    NO_DEFAULT_PATH
)

hunter_status_debug("GEOS_LIBRARY: ${GEOS_LIBRARY}")

if(NOT TARGET "geos")
  if(NOT GEOS_LIBRARY)
    message(FATAL_ERROR "GEOS_LIBRARY not found!")
  endif()
  add_library("geos" UNKNOWN IMPORTED)
  set_target_properties(
      "geos"
      PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${GEOS_INCLUDE_DIR}"
        IMPORTED_LOCATION "${GEOS_LIBRARY}"
  )
  get_filename_component(GEOS_LIB_DIR "${GEOS_LIBRARY}" DIRECTORY CACHE)
  hunter_status_debug("GEOS_LIB_DIR: ${ODB_LIB_DIR}")
  set(GEOS_FOUND TRUE)
endif()

# Find GEOS C library:
find_library(
    GEOS_C_LIBRARY
    geos_c
    PATHS
      "${GEOS_ROOT}/lib"
    NO_DEFAULT_PATH
)

hunter_status_debug("GEOS_C_LIBRARY: ${GEOS_C_LIBRARY}")

if(NOT TARGET "geos::c")
  if(NOT GEOS_C_LIBRARY)
    message(FATAL_ERROR "GEOS_C_LIBRARY not found!")
  endif()
  add_library("geos::c" UNKNOWN IMPORTED)
  set_target_properties(
      "geos::c"
      PROPERTIES
        IMPORTED_LOCATION "${GEOS_C_LIBRARY}"
        IMPORTED_LINK_INTERFACE_LIBRARIES "geos"
  )
endif()

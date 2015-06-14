# ----------------------------------------------------------------------
# FindSQLite3.cmake - SQLite3 CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# ----------------------------------------------------------------------

if(HUNTER_STATUS_DEBUG)
  message("[hunter] SQLITE3_ROOT ${SQLITE3_ROOT}") 
endif()

find_path(
    SQLITE3_INCLUDE_DIR 
      sqlite3.h
    PATHS
      "${SQLITE3_ROOT}/include"
    NO_DEFAULT_PATH
)
if(HUNTER_STATUS_DEBUG)
  message("[hunter] SQLITE3_INCLUDE_DIR ${SQLITE3_INCLUDE_DIR}") 
endif()

find_library(
    SQLITE3_LIBRARY 
      sqlite3
    PATHS
      "${SQLITE3_ROOT}/lib"
    NO_DEFAULT_PATH
)
if(HUNTER_STATUS_DEBUG)
  message("[hunter] SQLITE3_LIBRARY ${SQLITE3_LIBRARY}") 
endif()

if(NOT TARGET "SQLite3")
  if(SQLITE3_INCLUDE_DIR AND SQLITE3_LIBRARY)
    set(SQLITE3_FOUND TRUE)
    add_library("SQLite3" UNKNOWN IMPORTED)
    set_target_properties(
        "SQLite3"
        PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${SQLITE3_INCLUDE_DIR}"
        IMPORTED_LOCATION "${SQLITE3_LIBRARY}"
    )
  get_filename_component(SQLITE3_LIB_DIR "${SQLITE3_LIBRARY}" DIRECTORY CACHE)
elseif(SQLite3_FIND_REQUIRED)
    message(FATAL_ERROR "[hunter] Could not find SQLite3")
  endif()
endif()

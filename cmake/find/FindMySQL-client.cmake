# ----------------------------------------------------------------------
# FindMySQL.cmake - MySQL CMake module
#
# Copyright (C) 2016 Alexandre Pretyman. All rights reserved.
#
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("MYSQL-CLIENT_ROOT: ${MYSQL-CLIENT_ROOT}")

find_path(
    MYSQL-CLIENT_INCLUDE_DIR
      mysql.h
    PATHS
     "${MYSQL-CLIENT_ROOT}/include"
      NO_DEFAULT_PATH
)

find_library(
    MYSQL-CLIENT_LIBRARY
      mysqlclient
    NAMES
      ${MYSQL-CLIENT_NAMES}
    PATHS
      "${MYSQL-CLIENT_ROOT}/lib"
)

if(MYSQL-CLIENT_INCLUDE_DIR AND MYSQL-CLIENT_LIBRARY)
  set(MYSQL-CLIENT_FOUND TRUE)
  add_library("MySQL::client" UNKNOWN IMPORTED)
  set_target_properties(
      "MySQL::client"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${MYSQL-CLIENT_INCLUDE_DIR}"
      IMPORTED_LOCATION "${MYSQL-CLIENT_LIBRARY}"
  )
elseif(MYSQL-CLIENT_FIND_REQUIRED)
  message(FATAL_ERROR "MySQL-client library not found")
else()
  set(MYSQL-CLIENT_FOUND FALSE)
endif()


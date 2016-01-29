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
    MYSQL_INCLUDE_DIR
      mysql.h
    PATHS
     "${MYSQL-CLIENT_ROOT}/include"
      NO_DEFAULT_PATH
)

set(MYSQL-CLIENT_NAMES mysqlclient mysqlclient_r)
find_library(
    MYSQL_LIBRARY
    NAMES
      ${MYSQL-CLIENT_NAMES}
    PATHS
      "${MYSQL-CLIENT_ROOT}/lib"
)

if(MYSQL_INCLUDE_DIR AND MYSQL_LIBRARY)
  set(MYSQL_FOUND TRUE)
  set(MYSQL_LIBRARIES ${MYSQL_LIBRARY})
  add_library("MySQL::client" UNKNOWN IMPORTED)
  set_target_properties(
      "MySQL::client"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${MYSQL_INCLUDE_DIR}"
      IMPORTED_LOCATION "${MYSQL_LIBRARY}"
  )
elseif(MYSQL_FIND_REQUIRED)
  message(FATAL_ERROR "MySQL-client libraries not found: ${MYSQL-CLIENT_NAMES}")
else()
  set(MYSQL_FOUND FALSE)
endif()


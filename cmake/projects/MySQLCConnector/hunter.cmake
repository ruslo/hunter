# Copyright (c) 2014-2015, David Linten
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_MYSQLCCONNECTOR_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_MYSQLCCONNECTOR_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    MySQLCConnector
    VERSION
    "v6.1.6"
    URL
    "https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.6-src.tar.gz"
    SHA1
    2444586365c2c58e7ca2397d4617e5fe19f9f246
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(MySQLCConnector)
hunter_download(PACKAGE_NAME MySQLCConnector)

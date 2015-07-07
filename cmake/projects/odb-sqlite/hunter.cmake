# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ODB-SQLITE_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ODB-SQLITE_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_package(odb)
hunter_add_package(SQLite3)

hunter_add_version(
    PACKAGE_NAME
    odb-sqlite
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-sqlite-2.4.0.tar.bz2"
    SHA1
    3be07e7702abf8adcbe7736f372ef9980cec1003
)

hunter_pick_scheme(DEFAULT url_sha1_odb-sqlite_autotools)
hunter_download(
    PACKAGE_NAME odb-sqlite
    PACKAGE_DEPENDS_ON odb SQLite3
)

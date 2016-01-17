# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ODB-PGSQL_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ODB-PGSQL_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    odb-pgsql
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.bz2"
    SHA1
    4628d5e296da01dbaf8658fd402b4f709f30ea2d
)

hunter_pick_scheme(DEFAULT url_sha1_odb-pgsql_autotools)
hunter_download(PACKAGE_NAME odb-pgsql)


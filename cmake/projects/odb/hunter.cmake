# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ODB_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ODB_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    odb
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-2.4.0.tar.bz2"
    SHA1
    42bd2a8023e338e004711e755eb30bd122b844a6
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME odb)

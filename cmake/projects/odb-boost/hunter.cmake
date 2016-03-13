# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ODB-BOOST_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ODB-BOOST_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    odb-boost
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-boost-2.4.0.tar.bz2"
    SHA1
    f813702b2856732e199ae34e3393b8cecff878ef
)

hunter_pick_scheme(DEFAULT url_sha1_odb-boost_autotools)
hunter_download(PACKAGE_NAME odb-boost)


# Copyright (c) 2014-2015, Oliver Daniell
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SZIP_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SZIP_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    szip
    VERSION
    "2.1.0-p1"
    URL
    "https://github.com/hunter-packages/szip/archive/v2.1.0-p1.tar.gz"
    SHA1
    "d06206d6f4ac1079ab222b97423efa8361b4903e"
)

hunter_cacheable(szip)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME szip)

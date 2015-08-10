# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GEOS_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GEOS_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    geos
    VERSION
    "3.4.2"
    URL
    "https://github.com/pretyman/libgeos/archive/libgeos-3.4.2.tar.gz"
    SHA1
    bee9fa1bb30bb0cd6d7d770e43886c3ff8e393eb
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME geos)

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
    f6ea15c96b478cf33f2aa81b00e31c2cdd8ee951
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME geos)

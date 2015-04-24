# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "18.14-p1"
    URL
    "https://github.com/hunter-packages/dlib/archive/v18.14-p1.tar.gz"
    SHA1
    bf73cd97ab81162e085d06f1b4595902abe5a436
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME dlib)

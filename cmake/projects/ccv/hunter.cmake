# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_CCV_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CCV_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

hunter_add_version(
    PACKAGE_NAME
    ccv
    VERSION
    "0.7-p4"
     URL
     "https://github.com/headupinclouds/ccv/archive/v0.7-p4.tar.gz"
     SHA1
     e2b3f7c6093fe94fe746e3825935ae5b4db65f17
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME ccv)
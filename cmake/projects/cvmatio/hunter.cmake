# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.11"
     URL
     "https://github.com/hunter-packages/cvmatio/archive/v1.0.11.tar.gz"
     SHA1
     dd6f9af0d3a345879df4096b988ab6ff15985080
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_download(PACKAGE_NAME cvmatio)
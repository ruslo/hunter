# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GLOG_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GLOG_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "1.0.1"
    URL
    "https://github.com/headupinclouds/google-glog-cmake/archive/v1.0.1.tar.gz"
    SHA1
    df1295891162fd08ba769ea4f59896dd43592bf9
)

# Pick a download scheme
hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug # For separate release/debug generators, like Makefile
    COMBINED
    url_sha1_combined_release_debug # For Xcode and Visual Studio
)

# Download package.
# Two versions of library will be built:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME glog)
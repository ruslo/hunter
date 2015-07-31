# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CEREAL_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CEREAL_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(cereal)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    cereal
    VERSION
    "1.1.2-p5"
    URL
    "https://github.com/headupinclouds/cereal/archive/v1.1.2-p5.tar.gz"
    SHA1
    4b761dacf480b2dafab02f7f50060bc6c9e78dc7
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME cereal)

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_CLAPACK_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CLAPACK_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _hunter_ios)
if(_hunter_ios)
  hunter_report_broken_package("CLAPACK is broken on iOS")
endif()

hunter_add_version_start(CLAPACK)

hunter_add_version(
    PACKAGE_NAME
    CLAPACK
    VERSION
    "3.2.1"
    URL
    "https://github.com/hunter-packages/clapack/archive/v3.2.1.tar.gz"
    SHA1
    f4410074450a6f733e47e2b6a9b5cc79e7d7c22f
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME CLAPACK)

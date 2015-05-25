# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BZIP2_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BZIP2_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _hunter_ios)
if(_hunter_ios)
  hunter_report_broken_package("BZip2 is broken on iOS")
endif()

hunter_add_version(
    PACKAGE_NAME
    BZip2
    VERSION
    "1.0.6-p1"
    URL
    "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p1.tar.gz"
    SHA1
    5eae50a9a0ded0ee0ea5201001b2f4f726dbf8ed
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(BZip2)
hunter_download(PACKAGE_NAME BZip2)

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _hunter_ios)
if(_hunter_ios)
  hunter_report_broken_package("GSL is broken on iOS")
endif()

hunter_add_version(
    PACKAGE_NAME
    GSL
    VERSION
    "2.1.0-p1"
    URL
    "https://github.com/hunter-packages/gsl/archive/v2.1.0-p1.tar.gz"
    SHA1
    113574a44eb276dd8ec7c8342400f01f29105299
)

hunter_add_version(
    PACKAGE_NAME
    GSL
    VERSION
    "2.1.0-p0"
    URL
    "https://github.com/hunter-packages/gsl/archive/v2.1.0-p0.tar.gz"
    SHA1
    9a1163362a0a82fd2ffa4f25b0bbd8d3e456f546
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GSL)
hunter_download(PACKAGE_NAME GSL)

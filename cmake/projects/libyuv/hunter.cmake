# Copyright (c) 2014-2015, Ruslan Baratov
# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LIBYUV_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIBYUV_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
	libyuv
    VERSION
	"1514-p3"
    URL
	"https://github.com/headupinclouds/libyuv/archive/v1514-p3.tar.gz"
    SHA1
	901e135d27bfd2bf3faf6f16efe5d067e10d51f8
)

hunter_cmake_args(libyuv CMAKE_ARGS BUILD_EXAMPLES=OFF LIBYUV_USE_JPEG=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libyuv)
hunter_download(PACKAGE_NAME libyuv)

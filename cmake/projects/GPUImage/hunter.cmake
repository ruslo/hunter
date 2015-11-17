# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GPUIMAGE_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GPUIMAGE_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-p5"
    URL
    "https://github.com/hunter-packages/GPUImage/archive/v0.1.6-p5.tar.gz"
    SHA1
    463564d96442c214d21faa28a3ca229962ca086c
	)

  hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-p6"
    URL
    "https://github.com/headupinclouds/GPUImage/archive/v0.1.6-p6.tar.gz"
    SHA1
	230f9f9ba0fe1cce96827ea0cfc944b6df05ec34
	)

hunter_cmake_args(
    GPUImage
    CMAKE_ARGS GPUIMAGE_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GPUImage)
hunter_download(PACKAGE_NAME GPUImage)

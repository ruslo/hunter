# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ARRAYFIRE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ARRAYFIRE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ArrayFire
    VERSION
    3.3.alpha-p0
    URL
    "https://github.com/hunter-packages/arrayfire/archive/v3.3.alpha-p0.tar.gz"
    SHA1
    70fdc7d4517129fe0f91255c1c4f8841840ed501
)

hunter_cmake_args(
    ArrayFire
    CMAKE_ARGS BUILD_TEST=OFF BUILD_EXAMPLES=OFF BUILD_GRAPHICS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ArrayFire)
hunter_download(PACKAGE_NAME ArrayFire)

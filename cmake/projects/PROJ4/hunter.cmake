# Copyright (c) 2017, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# use base url for official PROJ4 releases
set(_hunter_proj4_base_url_origin "https://github.com/OSGeo/proj.4/archive")
set(_hunter_proj4_base_url_neroburner "https://github.com/NeroBurner/proj.4/archive")

hunter_add_version(
    PACKAGE_NAME
    PROJ4
    VERSION
    "4.9.3"
    URL
    "${_hunter_proj4_base_url_neroburner}/4.9.3-p0.tar.gz"
    SHA1
    9c6e54d5b9dd0b8e0072a136514580922cea8944
)


# disable PROJ4 tests
hunter_cmake_args(PROJ4 CMAKE_ARGS
  BUILD_LIBPROJ_SHARED=NO
  PROJ4_TESTS=OFF
  # disable bin building
  DBUILD_CS2CS=OFF
  BUILD_GEOD=OFF
  BUILD_NAD2BIN=OFF
  BUILD_PROJ=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(PROJ4)
hunter_download(PACKAGE_NAME PROJ4)


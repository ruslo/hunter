# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    cpuinfo
    VERSION
    0.0.0-d5e37ad-p0
    URL
    https://github.com/hunter-packages/cpuinfo/archive/v0.0.0-d5e37ad-p0.tar.gz
    SHA1
    211cc7d1d630e56ee22770f0a9d35c4774d7e671
)

hunter_cmake_args(cpuinfo CMAKE_ARGS 
  CPUINFO_BUILD_TOOLS=OFF
  CPUINFO_BUILD_UNIT_TESTS=OFF
  CPUINFO_BUILD_MOCK_TESTS=OFF
  CPUINFO_BUILD_BENCHMARKS=OFF
  CLOG_BUILD_TESTS=OFF
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cpuinfo)
hunter_download(PACKAGE_NAME cpuinfo)

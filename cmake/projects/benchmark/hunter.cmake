# Copyright (c) 2017, Giuseppe Roberti
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    benchmark
    VERSION
    "1.1.0-hunter"
    URL
    "https://github.com/hunter-packages/benchmark/archive/v1.1.0-hunter.tar.gz"
    SHA1
    1caeb5603ec46d24a08cc7419200875e090c254b
)

hunter_cmake_args(
    benchmark
    CMAKE_ARGS
    BENCHMARK_ENABLE_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(benchmark)
hunter_download(PACKAGE_NAME benchmark)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME benchmark
    VERSION "1.4.0"
    URL "https://github.com/google/benchmark/archive/v1.4.0.tar.gz"
    SHA1 "7d3c1379319d1c1c74e0854d023a0bf16f0cc978"
)

hunter_add_version(
    PACKAGE_NAME benchmark
    VERSION "1.3.0"
    URL "https://github.com/google/benchmark/archive/v1.3.0.tar.gz"
    SHA1 "ea74b9d99327f7ef8150dc7c683e6155fa29ef3c")

hunter_add_version(
    PACKAGE_NAME benchmark
    VERSION "1.2.0"
    URL "https://github.com/google/benchmark/archive/v1.2.0.tar.gz"
    SHA1 "5f26619848c59ddc354e2d51e2f196d2a6ddb189")

hunter_cmake_args(benchmark CMAKE_ARGS BENCHMARK_ENABLE_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(benchmark)
hunter_download(PACKAGE_NAME benchmark)

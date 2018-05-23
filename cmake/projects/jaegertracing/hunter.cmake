# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME jaegertracing
    VERSION "0.4.1"
    URL "https://github.com/jaegertracing/jaeger-client-cpp/archive/v0.4.1.tar.gz"
    SHA1 "b398a8174cad9d2e815e2bc9910f75c89e35a46a")

hunter_cmake_args(jaegertracing CMAKE_ARGS
    BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jaegertracing)
hunter_download(PACKAGE_NAME jaegertracing)

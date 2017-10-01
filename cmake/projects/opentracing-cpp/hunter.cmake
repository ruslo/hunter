# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.0.0"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.0.0.tar.gz"
    SHA1 "f94f4f617ca225c689ccc9d5e9bbb07b0a8500ce")

hunter_cmake_args(opentracing-cpp CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(opentracing-cpp)
hunter_download(PACKAGE_NAME opentracing-cpp)

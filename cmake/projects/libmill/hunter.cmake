# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libmill
    VERSION "1.18"
    URL "https://github.com/hunter-packages/libmill/archive/hunter-1.18.tar.gz"
    SHA1 "447807f84cbd3369d3031b394e0941574e01b08a")
hunter_cmake_args(libmill CMAKE_ARGS
                  BUILD_TESTING=OFF
                  BUILD_PERF=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libmill)
hunter_download(PACKAGE_NAME libmill)

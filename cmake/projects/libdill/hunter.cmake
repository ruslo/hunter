# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libdill
    VERSION "1.6"
    URL "https://github.com/hunter-packages/libdill/archive/hunter-1.6.tar.gz"
    SHA1 "603ca85ac4b0d9f0ab4f5db57281127370c5cacc")
hunter_cmake_args(libdill CMAKE_ARGS
                  BUILD_TESTING=OFF
                  BUILD_PERF=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libdill)
hunter_download(PACKAGE_NAME libdill)

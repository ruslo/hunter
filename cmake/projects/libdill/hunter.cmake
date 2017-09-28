# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libdill
    VERSION "1.6"
    URL "https://github.com/isaachier/libdill/archive/hunter-1.6-p0.tar.gz"
    SHA1 "e583b83bee8305ceddcbfdcbd7cdcb29ec405110")
hunter_cmake_args(libdill CMAKE_ARGS
                  BUILD_TESTING=OFF
                  BUILD_PERF=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libdill)
hunter_download(PACKAGE_NAME libdill)

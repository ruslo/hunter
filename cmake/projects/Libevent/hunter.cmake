# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8"
    URL "https://github.com/isaachier/libevent/archive/hunter-2.1.8-p4.tar.gz"
    SHA1 "241616673bf8b13b69771c4969dc37d8d3954cbd")

hunter_cmake_args(Libevent CMAKE_ARGS
                  EVENT__DISABLE_TESTS=ON
                  EVENT__DISABLE_SAMPLES=ON
                  EVENT__DISABLE_REGRESS=ON
                  EVENT__DISABLE_BENCHMARK=ON)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Libevent)
hunter_download(PACKAGE_NAME Libevent)

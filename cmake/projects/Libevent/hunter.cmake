# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8"
    URL "https://github.com/hunter-packages/libevent/archive/v2.1.8-p2.tar.gz"
    SHA1 "492abb962dad3071f34bbe4975e28768fd29edf0")

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8-p3"
    URL "https://github.com/hunter-packages/libevent/archive/v2.1.8-p3.tar.gz"
    SHA1 "c6a1b1ffe52d73d9cf5c6ed2088708f8e6a093fe")

hunter_cmake_args(Libevent CMAKE_ARGS
                  EVENT__DISABLE_TESTS=ON
                  EVENT__DISABLE_SAMPLES=ON
                  EVENT__DISABLE_REGRESS=ON
                  EVENT__DISABLE_BENCHMARK=ON)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Libevent)
hunter_download(PACKAGE_NAME Libevent)

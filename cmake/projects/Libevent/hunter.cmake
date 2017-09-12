# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8"
    URL "https://github.com/hunter-packages/libevent/archive/v2.1.8-p0.tar.gz"
    SHA1 "0f95aa9fac6e64148ebd3e3d8fe94d0a0151eb56")

hunter_cmake_args(Libevent CMAKE_ARGS
                  EVENT__DISABLE_TESTS=ON
                  EVENT__DISABLE_SAMPLES=ON
                  EVENT__DISABLE_REGRESS=ON
                  EVENT__DISABLE_BENCHMARK=ON)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Libevent)
hunter_download(PACKAGE_NAME Libevent)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tao-pegtl
    VERSION
    2.5.1
    URL
    "https://github.com/taocpp/PEGTL/archive/2.5.1.zip"
    SHA1
    3d2a2a0eb1b928882f4d827c75c5d4290cd58082
)

hunter_cmake_args(
   tao-pegtl
   CMAKE_ARGS
    PEGTL_BUILD_TESTS=OFF
    PEGTL_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tao-pegtl)
hunter_download(
    PACKAGE_NAME tao-pegtl
    PACKAGE_INTERNAL_DEPS_ID "1"
)

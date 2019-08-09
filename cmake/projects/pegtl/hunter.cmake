# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)


# master branch will be the next 3.x.x release in pegtl
hunter_add_version(
    PACKAGE_NAME
    pegtl
    VERSION
    3.0.0-697aaa06
    URL
    "https://github.com/taocpp/PEGTL/archive/697aaa06564c6ea9d13f95de081a2d2d46b39160.zip"
    SHA1
    3b441aee41d1932809807ba27f30ca95602e322c
)

hunter_add_version(
    PACKAGE_NAME
    pegtl
    VERSION
    2.8.1
    URL
    "https://github.com/taocpp/PEGTL/archive/2.8.1.tar.gz"
    SHA1
    50a8f7a24062794fb7caccc45ca7c635258595e3
)

hunter_add_version(
    PACKAGE_NAME
    pegtl
    VERSION
    2.8.0
    URL
    "https://github.com/taocpp/PEGTL/archive/2.8.0.tar.gz"
    SHA1
    57457c00d90b1c33d50afbb2956cbf2b2533ce6e
)

hunter_add_version(
    PACKAGE_NAME
    pegtl
    VERSION
    2.5.1
    URL
    "https://github.com/taocpp/PEGTL/archive/2.5.1.zip"
    SHA1
    3d2a2a0eb1b928882f4d827c75c5d4290cd58082
)

hunter_cmake_args(
   pegtl
   CMAKE_ARGS
    PEGTL_BUILD_TESTS=OFF
    PEGTL_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pegtl)
hunter_download(
    PACKAGE_NAME pegtl
)

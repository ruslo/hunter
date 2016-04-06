
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Washer
    VERSION
    "0.1.2"
    URL
    "https://github.com/alamaison/washer/archive/0.1.2.tar.gz"
    SHA1
    b32cf57e0c8f998c6243bf2385f6ab04038f8b0f
)

hunter_add_version(
    PACKAGE_NAME
    Washer
    VERSION
    "0.1.1"
    URL
    "https://github.com/alamaison/washer/archive/0.1.1.tar.gz"
    SHA1
    dc979493884e1eed89b5e0c1d03284c40d897a4e
)

hunter_add_version(
    PACKAGE_NAME
    Washer
    VERSION
    "0.1.0"
    URL
    "https://github.com/alamaison/washer/archive/0.1.0.tar.gz"
    SHA1
    dc0e12f1f3eafdf9af98887a62828d6f513b2446
)

hunter_cmake_args(
    Washer
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Washer)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME jansson
    VERSION "2.11.0"
    URL "https://github.com/hunter-packages/jansson/archive/v2.11-p0.tar.gz"
    SHA1 "4f5855dac698e9658fd94620b64f8430f265be1d")

hunter_cmake_args(jansson CMAKE_ARGS
    JANSSON_BUILD_DOCS=OFF
    JANSSON_EXAMPLES=OFF
    JANSSON_WITHOUT_TESTS=ON)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jansson)
hunter_download(PACKAGE_NAME jansson)

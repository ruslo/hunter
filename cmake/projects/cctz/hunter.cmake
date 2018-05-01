# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME cctz
    VERSION "2.2.0"
    URL "https://github.com/hunter-packages/cctz/archive/hunter-2.2-p0.tar.gz"
    SHA1 "86d5ab7555a2f6a8c255dcb50fb7734c4cb8fdfd")

hunter_cmake_args(cctz CMAKE_ARGS BUILD_TESTING=OFF BUILD_EXAMPLES=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cctz)
hunter_download(PACKAGE_NAME cctz)

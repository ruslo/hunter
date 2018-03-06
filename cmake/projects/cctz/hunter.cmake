# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME cctz
    VERSION "2.2.0"
    URL "https://github.com/isaachier/cctz/archive/hunter-2.2-p0.tar.gz"
    SHA1 "88a2ddb2840e69cef98a3fde618b4e4ff952f39f")

hunter_cmake_args(cctz CMAKE_ARGS BUILD_TESTING=OFF BUILD_EXAMPLES=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cctz)
hunter_download(PACKAGE_NAME cctz)

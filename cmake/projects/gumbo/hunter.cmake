# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME gumbo
    VERSION "0.10.1"
    URL "https://github.com/isaachier/gumbo-parser/archive/hunter-0.10.1-p2.tar.gz"
    SHA1 "b33e7738e12611ffe2deb6dc98c5d802879abf82")

hunter_cmake_args(gumbo CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gumbo)
hunter_download(PACKAGE_NAME gumbo)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME gumbo
    VERSION "0.10.1"
    URL "https://github.com/isaachier/gumbo-parser/archive/hunter-0.10.1-p1.tar.gz"
    SHA1 "44c29f792d2129fbd5df55dea529e4b5f2271bce")

hunter_cmake_args(gumbo CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gumbo)
hunter_download(PACKAGE_NAME gumbo)

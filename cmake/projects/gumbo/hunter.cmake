# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME gumbo
    VERSION "0.10.1"
    URL "https://github.com/isaachier/gumbo-parser/archive/hunter-0.10.1-p3.tar.gz"
    SHA1 "52152366cbc15f9f5c2499d6c14f2c9c86a2f26f")

hunter_cmake_args(gumbo CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gumbo)
hunter_download(PACKAGE_NAME gumbo)

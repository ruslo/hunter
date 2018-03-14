# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pcg
    VERSION "0.0.0"
    URL "https://github.com/hunter-packages/pcg-c/archive/v0.0.0-p0.tar.gz"
    SHA1 "ff5e6a7f6f7a169cb6d70960104c1d0ccf781191")

hunter_cmake_args(pcg CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pcg)
hunter_download(PACKAGE_NAME pcg)

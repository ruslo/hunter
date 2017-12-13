# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME sds
    VERSION "2.0.0"
    URL "https://github.com/hunter-packages/sds/archive/v2.0.0.tar.gz"
    SHA1 "afbfd0c74a4130166e7b18d3f088e38bed7583d3")

hunter_cmake_args(sds CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(sds)
hunter_download(PACKAGE_NAME sds)

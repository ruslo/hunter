# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME h3
    VERSION "3.0.4"
    URL "https://github.com/uber/h3/archive/v3.0.4.tar.gz"
    SHA1 "e09d18583e3da9d03d718fba482d2281eff011d1")

hunter_cmake_args(h3 CMAKE_ARGS
    BUILD_TESTING=OFF
    ENABLE_DOCS=OFF
    ENABLE_LINTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(h3)
hunter_download(PACKAGE_NAME h3)

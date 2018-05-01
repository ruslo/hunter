# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libevhtp
    VERSION "1.2.16-p4"
    URL "https://github.com/hunter-packages/libevhtp/archive/v1.2.16-p4.tar.gz"
    SHA1 "c6d7b4b4e27de15670f72e36b127613a707164ee")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libevhtp)
hunter_download(PACKAGE_NAME libevhtp)

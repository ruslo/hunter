# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME c-ares
    VERSION "1.13.0"
    URL "https://github.com/c-ares/c-ares/archive/cares-1_13_0.tar.gz"
    SHA1 "00a0dcb85db6f08afdaf4731cc8e3606daf5a12b")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(c-ares)
hunter_download(PACKAGE_NAME c-ares)

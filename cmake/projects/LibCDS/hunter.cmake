# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME LibCDS
    VERSION "2.3.1"
    URL "https://github.com/hunter-packages/libcds/archive/v2.3.1-p0.tar.gz"
    SHA1 "86cc0d2d57075830feaaa1c6e1200e970b96f9f8")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(LibCDS)
hunter_download(PACKAGE_NAME LibCDS)

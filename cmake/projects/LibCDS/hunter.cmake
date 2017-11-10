# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME LibCDS
    VERSION "2.3.1"
    URL "https://github.com/isaachier/libcds/archive/hunter-2.3.1-p3.tar.gz"
    SHA1 "8d039bf19b08d2b6506384f78a11e2cfdab02c3d")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(LibCDS)
hunter_download(PACKAGE_NAME LibCDS)

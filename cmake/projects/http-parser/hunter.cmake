# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME http-parser
    VERSION "2.8.0"
    URL "https://github.com/hunter-packages/http-parser/archive/v2.8.0-p0.tar.gz"
    SHA1 "3ef5048ecc6625f75a8c756026f501ebd5f3f388")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(http-parser)
hunter_download(PACKAGE_NAME http-parser)

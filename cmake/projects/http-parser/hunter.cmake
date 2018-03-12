# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME http-parser
    VERSION "2.8.0"
    URL "https://github.com/isaachier/http-parser/archive/hunter-2.8.0-p0.tar.gz"
    SHA1 "3ae0cbc6eb5d1e013b19718235bf0feb0182f661")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(http-parser)
hunter_download(PACKAGE_NAME http-parser)

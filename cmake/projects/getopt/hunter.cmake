# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    getopt
    VERSION
    "1.0.0-p0"
    URL
    "https://github.com/caseymcc/getopt/archive/1.0.0-p0.tar.gz"
    SHA1
    4e9a11b5dad6ff849fbb775556df02251198c249
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(getopt)

if(NOT MSVC) #only for Visual Studios, all other posix compiliers should have getopt
    hunter_user_error("Only for MSVC")
endif()

hunter_download(PACKAGE_NAME getopt)

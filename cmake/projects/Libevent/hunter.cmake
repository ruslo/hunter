# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8"
    URL "https://github.com/isaachier/libevent/archive/hunter-release-2.1.8-alpha.tar.gz"
    SHA1 "fc0e6257bb5798d80969f67c4d346915ebae094d")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
#hunter_cacheable(Libevent)
hunter_download(PACKAGE_NAME Libevent)

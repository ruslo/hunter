# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME Libevent
    VERSION "2.1.8"
    URL "https://github.com/isaachier/libevent/archive/hunter-2.1.8-p1.tar.gz"
    SHA1 "743ee49ede4a1cb2a1020e24ee9b1c061255d475")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Libevent)
hunter_download(PACKAGE_NAME Libevent)

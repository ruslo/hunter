# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME grpc
    VERSION "1.6.6"
    URL "https://github.com/isaachier/grpc/archive/hunter-1.6.6-p1.tar.gz"
    SHA1 "f56377c213a4c845b149e5bf5b48e6d1cc3e5d17")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(grpc)
hunter_download(PACKAGE_NAME grpc)

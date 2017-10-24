# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.6.6"
    URL "https://github.com/isaachier/grpc/archive/hunter-1.6.6-p6.tar.gz"
    SHA1 "c4abbf4a411f794f4cac2a0ec2311187b6fee31f")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gRPC)
hunter_download(PACKAGE_NAME gRPC)

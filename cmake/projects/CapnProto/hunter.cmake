# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME CapnProto
    VERSION "0.6.0"
    URL "https://capnproto.org/capnproto-c++-0.6.0.tar.gz"
    SHA1 c601f0d9da8942fc19dffca79ac3f2279297047b
)

hunter_cmake_args(CapnProto CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CapnProto)
hunter_download(PACKAGE_NAME CapnProto)

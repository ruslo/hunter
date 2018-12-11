# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME CapnProto
    VERSION "0.7.0"
    URL "https://capnproto.org/capnproto-c++-0.7.0.tar.gz"
    SHA1 348f5af790c65927480106e1143c9c9554cf2443
)

hunter_add_version(
    PACKAGE_NAME CapnProto
    VERSION "0.6.1"
    URL "https://capnproto.org/capnproto-c++-0.6.1.tar.gz"
    SHA1 745dc4c60c02d0a664574a63ec85ef7a03c57676
)

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

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME protobuf-c
    VERSION "1.3.0-p0"
    URL "https://github.com/hunter-packages/protobuf-c/archive/v1.3.0-p0.tar.gz"
    SHA1 "e106e376b95650521e860642cd660e503a2d4f5c")

hunter_add_version(
    PACKAGE_NAME protobuf-c
    VERSION "1.3.0-p1"
    URL "https://github.com/hunter-packages/protobuf-c/archive/v1.3.0-p1.tar.gz"
    SHA1 "d93fc3f0f422f62a5c0454981f73a5acdbf8b078")

hunter_cmake_args(protobuf-c CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(protobuf-c)
hunter_download(PACKAGE_NAME protobuf-c)

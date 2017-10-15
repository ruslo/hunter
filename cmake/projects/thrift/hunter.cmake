# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME thrift
    VERSION "0.10.0"
    URL "https://github.com/hunter-packages/thrift/archive/v0.10.0-p0.tar.gz"
    SHA1 "e346fd04d2228e4d08df363b4f260d92d12e7b67")

hunter_add_version(
    PACKAGE_NAME thrift
    VERSION "0.9.2"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.9.2-p0.tar.gz"
    SHA1 "ffcc08215308e6d2b6b67a54281d5bad31c1919e")

hunter_cmake_args(thrift CMAKE_ARGS
    BUILD_TESTING=OFF
    BUILD_TUTORIALS=OFF
    BUILD_HASKELL=OFF
    BUILD_JAVA=OFF
    BUILD_C_GLIB=OFF
    WITH_QT4=OFF
    WITH_QT5=OFF
    WITH_SHARED_LIB=OFF
    WITH_PLUGIN=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(thrift)
hunter_download(PACKAGE_NAME thrift)

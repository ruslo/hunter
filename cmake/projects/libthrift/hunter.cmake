# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.10.0"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.10.0-p6.tar.gz"
    SHA1 "a5b7ec6920462890641c20e8e289c6a6e9ec206d")

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.9.2"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.9.2-p3.tar.gz"
    SHA1 "c40af1a45072110a7c416fd3b6a2f3326de9b3dc")

hunter_cmake_args(libthrift CMAKE_ARGS
    BUILD_TESTING=OFF
    BUILD_TUTORIALS=OFF
    BUILD_HASKELL=OFF
    BUILD_COMPILER=OFF
    BUILD_JAVA=OFF
    BUILD_C_GLIB=OFF
    WITH_QT4=OFF
    WITH_QT5=OFF
    WITH_SHARED_LIB=OFF
    WITH_PLUGIN=OFF
    WITH_LIBEVENT=OFF
    WITH_OPENSSL=OFF
    WITH_ZLIB=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libthrift)
hunter_download(PACKAGE_NAME libthrift)

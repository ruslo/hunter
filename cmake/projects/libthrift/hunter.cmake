# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.10.0"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.10.0-p7.tar.gz"
    SHA1 "f5cc2fae935fba47ae4b441e0f651bff84a3cc83")

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.9.2"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.9.2-p4.tar.gz"
    SHA1 "9d5b60c9af6583a3d4f516f70db1262de7db1c73")

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

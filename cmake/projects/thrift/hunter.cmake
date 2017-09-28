# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME thrift
    VERSION "0.10.0"
    URL "https://github.com/isaachier/thrift/archive/hunter-0.10.0-p4.tar.gz"
    SHA1 "1a3e19d7cc956fc083aee02cc23686a2754a599b")

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

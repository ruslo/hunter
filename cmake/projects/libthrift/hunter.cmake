# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.10.0"
    URL "https://github.com/hunter-packages/thrift/archive/v0.10.0-p2.tar.gz"
    SHA1 "9060fe039f57ea11d1143299b456ff98d4cc56c2")

hunter_add_version(
    PACKAGE_NAME libthrift
    VERSION "0.9.2"
    URL "https://github.com/hunter-packages/thrift/archive/v0.9.2-p2.tar.gz"
    SHA1 "0dba938473a718a547b0f21ad3bd6eda2a2574ac")

hunter_cmake_args(libthrift CMAKE_ARGS
    BUILD_TESTING=OFF
    BUILD_TUTORIALS=OFF
    BUILD_COMPILER=OFF
    BUILD_C_GLIB=OFF
    BUILD_CPP=ON
    BUILD_HASKELL=OFF
    BUILD_JAVA=OFF
    BUILD_PYTHON=OFF
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

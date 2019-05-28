# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME leveldb
    VERSION "1.20"
    URL "https://github.com/hunter-packages/leveldb/archive/v1.20-p3.tar.gz"
    SHA1 "e843a3321605bd818628509c669d6dae65854657")

hunter_add_version(
    PACKAGE_NAME leveldb
    VERSION "1.22"
    URL "https://github.com/hunter-packages/leveldb/archive/v1.22-p0.tar.gz"
    SHA1 "616e3816c0f44423136dcf286ae51417f0d75198")

hunter_cmake_args(leveldb CMAKE_ARGS
    LEVELDB_BUILD_TESTS=OFF
    LEVELDB_BUILD_BENCHMARKS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(leveldb)
hunter_download(PACKAGE_NAME leveldb)

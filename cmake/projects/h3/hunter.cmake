# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME h3
    VERSION "3.0.4"
    URL "https://github.com/uber/h3/archive/v3.0.4.tar.gz"
    SHA1 "e09d18583e3da9d03d718fba482d2281eff011d1")

hunter_add_version(
    PACKAGE_NAME h3
    VERSION "3.0.5"
    URL "https://github.com/uber/h3/archive/v3.0.5.tar.gz"
    SHA1 "ff4bc3c066dbfcb2ee1aa6474f63c934b0dfe4ee")

hunter_add_version(
    PACKAGE_NAME h3
    VERSION "3.0.6"
    URL "https://github.com/uber/h3/archive/v3.0.6.tar.gz"
    SHA1 "bb8502a7e7b6c2e367874dcd55677c6d288e6cc7")

hunter_add_version(
    PACKAGE_NAME h3
    VERSION "3.0.7"
    URL "https://github.com/uber/h3/archive/v3.0.7.tar.gz"
    SHA1 "062dbe6f17a19d5734a7d538fcfade2ae8949b04")

hunter_cmake_args(h3 CMAKE_ARGS
    BUILD_TESTING=OFF
    ENABLE_DOCS=OFF
    ENABLE_LINTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(h3)
hunter_download(PACKAGE_NAME h3)


# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Comet
    VERSION
    "4.0.0"
    URL
    "https://github.com/alamaison/comet/archive/4.0.0.tar.gz"
    SHA1
    24e54dbd719e5b4e51a6806ee52d2bd302e1e097
)

hunter_add_version(
    PACKAGE_NAME
    Comet
    VERSION
    "4.0.1"
    URL
    "https://github.com/alamaison/comet/archive/4.0.1.tar.gz"
    SHA1
    18aca7e870fea6b9e732bf1fb50b2294430730e7
)

hunter_add_version(
    PACKAGE_NAME
    Comet
    VERSION
    "4.0.2"
    URL
    "https://github.com/alamaison/comet/archive/4.0.2.tar.gz"
    SHA1
    5f5ba94acfcbe4ee0b2a3242bf82f949beb30064
)

hunter_cmake_args(
    Comet
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Comet)
hunter_download(PACKAGE_NAME Comet)

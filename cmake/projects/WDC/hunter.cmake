# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.0.6"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.0.6.tar.gz"
    SHA1 db0358658f689cc9118d96acf1d6de6eeb4d9041
)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.0.5"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.0.5.tar.gz"
    SHA1 5f0d0cce727d079f3acc822737fc5e9f93aabed2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(WDC)
hunter_download(PACKAGE_NAME WDC)

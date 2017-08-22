# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.1.1"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.1.1.tar.gz"
    SHA1 ae111eee686c2f7d9091164ba270a6be11f8d4a8
)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.1.0"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.1.0.tar.gz"
    SHA1 cc0923530fd1ce13fe927592bad3999db4f22d5e
)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.0.9"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.0.9.tar.gz"
    SHA1 a4035ce5ac73581384c71105a4716839e1f54b5f
)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.0.8"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.0.8.tar.gz"
    SHA1 10db2c64fd9165011c9caaea572e07bf97c817cd
)

hunter_add_version(
    PACKAGE_NAME WDC
    VERSION "1.0.7"
    URL "https://github.com/CloudPolis/webdav-client-cpp/archive/v1.0.7.tar.gz"
    SHA1 58dd5181bf11f842f6eb8c7206d89070f2d52190
)

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

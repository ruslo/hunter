# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME oniguruma
    VERSION "6.8.1-p0"
    URL "https://github.com/hunter-packages/oniguruma/archive/v6.8.1-p0.tar.gz"
    SHA1 "6d82ba6bf7a7313b64ba9772622eeeb964e951fb")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(oniguruma)
hunter_download(PACKAGE_NAME oniguruma)

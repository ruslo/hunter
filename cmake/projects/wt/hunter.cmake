# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    wt
    VERSION
    "4.0.4-p0"
    URL
    "https://github.com/hunter-packages/wt/archive/v4.0.4-p0.tar.gz"
    SHA1
    5bdfd4787fc1733d2696e9dd17d334270941a91f
)

hunter_cmake_args(
    wt
    CMAKE_ARGS
        BUILD_EXAMPLES=OFF
        ENABLE_HARU=OFF
        ENABLE_PANGO=OFF
        ENABLE_POSTGRES=OFF
        ENABLE_FIREBIRD=OFF
        ENABLE_QT4=OFF
        ENABLE_LIBWTTEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

# FIXME: https://github.com/ruslo/hunter/pull/1655#issuecomment-446963534
# hunter_cacheable(wt)

hunter_download(PACKAGE_NAME wt)

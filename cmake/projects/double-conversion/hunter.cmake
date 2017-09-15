# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    double-conversion
    VERSION
    "3.0.0"
    URL
    "https://github.com/hunter-packages/double-conversion/archive/v3.0.0-p0.tar.gz"
    SHA1
    8cef7eff66b8488f996fb091f036eb6dc82f92d5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(double-conversion)
hunter_download(PACKAGE_NAME double-conversion)

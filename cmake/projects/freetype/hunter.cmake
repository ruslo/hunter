# By Denis Kerzhemanov, 2016

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    freetype
    VERSION
    "2.6.2"
    URL
    "https://github.com/hunter-packages/freetype/archive/v2.6.2-p0.tar.gz"
    SHA1
    d797e30cfa79eb95dc3b67e75fa6d6a3da80d1ae
)

hunter_add_version(
    PACKAGE_NAME
    freetype
    VERSION
    "2.4.12-p0"
    URL
    "https://github.com/hunter-packages/freetype/archive/v2.4.12-p0.tar.gz"
    SHA1
    6623f3b91b921c71c4b4485f67b252a7025eb18e
)

hunter_add_version(
    PACKAGE_NAME
    freetype
    VERSION
    "2.4.12-p1"
    URL
    "https://github.com/hunter-packages/freetype/archive/v2.4.12-p1.tar.gz"
    SHA1
    7f172287e594c916150f1b2a2882a188f945e969
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(freetype)
hunter_download(PACKAGE_NAME freetype)

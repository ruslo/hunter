# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    FakeIt
    VERSION
    "2.0.3"
    URL
    "https://github.com/hunter-packages/FakeIt/archive/2.0.3-hunter.tar.gz"
    SHA1
    9ac096c5d990bc8b8d8d8b0ac6b4902c21928a22
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FakeIt)
hunter_download(PACKAGE_NAME FakeIt)

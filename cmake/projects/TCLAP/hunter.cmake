
# by Cyberunner23
# for the Hunter project

# !!! DO NOT PLACE HEADER GUARDS HERE !!!


include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    TCLAP
    VERSION
    1.2.2-p1
    URL
    "https://github.com/hunter-packages/tclap/archive/v1.2.2-p1.zip"
    SHA1
    c31f3b37c5f1cc34e802000e338d3f04a4d5da79
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(TCLAP)
hunter_download(PACKAGE_NAME TCLAP)



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
    1.2.2-p0
    URL
    "https://github.com/hunter-packages/tclap/archive/v1.2.2-p0.zip"
    SHA1
    5cbc964840ed3d8d2e64bb57fd0c2897ca05e3b0
)

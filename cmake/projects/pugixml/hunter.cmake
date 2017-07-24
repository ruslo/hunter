# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pugixml
    VERSION "1.8.1"
    URL "https://github.com/rusdevops/pugixml/archive/v1.8.1-hunter.tar.gz"
    SHA1 005b1c8830e6f81f559d0b72f9f7ff320895847f
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pugixml)
hunter_download(PACKAGE_NAME pugixml)

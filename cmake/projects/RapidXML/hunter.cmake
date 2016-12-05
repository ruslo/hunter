# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    RapidXML
    VERSION
    "1.13"
    URL
    "https://github.com/hunter-packages/rapidxml/archive/v1.13-hunter.tar.gz"
    SHA1
    d7f9b263a4c1e90dca488d3cf040364339ff09e2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RapidXML)
hunter_download(PACKAGE_NAME RapidXML)

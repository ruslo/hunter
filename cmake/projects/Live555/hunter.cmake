# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
    PACKAGE_NAME
    Live555
    VERSION
    "2017.07.18"
    URL
    "https://download.videolan.org/pub/contrib/live555/live.2017.07.18.tar.gz"
    SHA1
    01558c54c7d6790e004a1dc021890a54eeaa639e
)

hunter_add_version(
    PACKAGE_NAME
    Live555
    VERSION
    "2016.11.28"
    URL
    "https://wx3sweden.se/live555-archive/live.2016.11.28.tar.gz"
    SHA1
    6df30a0c20c973e4f7f0dd1030a863fb6329cd7a
)

hunter_add_version(
    PACKAGE_NAME
    Live555
    VERSION
    "2014.10.07"
    URL
    "https://wx3sweden.se/live555-archive/liblivemedia-dmo_2014.10.07.tar.gz"
    SHA1
    d6d1919b78366efd366b1bfa1c27fddd1f060f3c
)

hunter_pick_scheme(DEFAULT url_sha1_live555)

hunter_cacheable(Live555)
hunter_download(
    PACKAGE_NAME Live555
    #PACKAGE_INTERNAL_DEPS_ID "1"
)

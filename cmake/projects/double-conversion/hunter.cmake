# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    double-conversion
    VERSION
    "3.0.0"
    URL
    "https://github.com/google/double-conversion/archive/v3.0.0.tar.gz"
    SHA1
    d900d4d946beb493a03cd6c9b180ed2bcbd0f20e
)

hunter_configuration_types(double-conversion CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME double-conversion)

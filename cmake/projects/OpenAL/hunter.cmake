# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME OpenAL
    VERSION "1.18.2"
    URL "https://github.com/kcat/openal-soft/archive/openal-soft-1.18.2.tar.gz"
    SHA1 "f819c6720c4beead7653ebc35fbb2c287a8970fc")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenAL)
hunter_download(PACKAGE_NAME OpenAL)

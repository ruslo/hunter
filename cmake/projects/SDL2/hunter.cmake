# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.4-h1"
    URL
    "https://github.com/hunter-packages/SDL2/archive/2.0.4-h1.tar.gz"
    SHA1
    632a4005aafb25d6fc894a93475f78832a1edd98
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL2)
hunter_download(PACKAGE_NAME SDL2)

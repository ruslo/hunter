# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.4-p0"
    URL
    "https://github.com/hunter-packages/SDL2/archive/2.0.4-p0.tar.gz"
    SHA1
    fcd56bd843432325fd7716d6ce8fdb4a049d521b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL2)
hunter_download(PACKAGE_NAME SDL2)

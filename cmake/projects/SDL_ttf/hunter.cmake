# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL_ttf
        VERSION
        "2.0.14"
        URL
        "https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.14.tar.gz"
        SHA1
        34c5fdc8508c7e14356579477f9ca2b0d6c06ffc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_ttf)
hunter_download(PACKAGE_NAME SDL_ttf)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL_image
        VERSION
        "2.0.1-p1"
        URL
        "https://github.com/hunter-packages/SDL_image_cmake/archive/2.0.1-p1.tar.gz"
        SHA1
        8f644d026256f48f0e2ba5411422eaf2a91c0463
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_image)
hunter_download(PACKAGE_NAME SDL_image)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!


include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SDL_ttf
    VERSION
    "2.0.14-p0"
    URL
    "https://github.com/hunter-packages/SDL_ttf/archive/v2.0.14-p0.tar.gz"
    SHA1
    cd7f7806b5de657081d558ef1c12033c43522efe
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_ttf)
hunter_download(PACKAGE_NAME SDL_ttf)

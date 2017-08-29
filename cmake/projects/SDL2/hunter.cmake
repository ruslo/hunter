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
        "2.0.4-p4"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p4.tar.gz"
        SHA1
        523d8fd427f707541c7e600ad4c37e0e7bdc3662
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p3"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p3.tar.gz"
        SHA1
        811f7577fb71fd84a391ef8c4878325effb56a8c
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p2"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p2.tar.gz"
        SHA1
        dfdcff72966c1b597154f21f59bf4d30964e8795
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p1"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p1.tar.gz"
        SHA1
        daebe20807e166f62f3671f742e81e8d2959388b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL2)
hunter_download(PACKAGE_NAME SDL2)

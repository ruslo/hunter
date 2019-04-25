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
        "2.0.4-p8"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p8.tar.gz"
        SHA1
        568db770b6a137ce576f738638c42df4aa215c31
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p7"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p7.tar.gz"
        SHA1
        3dddf9fc88868ba4aecc5c1e762f79eac0c06b70
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p6"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p6.tar.gz"
        SHA1
        c3b1e17ec55112f0a60d32707f70dcda5ac1d2ef
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p5"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p5.tar.gz"
        SHA1
        14dcb4c439f0dbd71ad0b92184b35e3a7f29e3ca
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p4"
        URL
        "https://github.com/hunter-packages/SDL2/archive/2.0.4-p4.tar.gz"
        SHA1
        589fcb46963b28e9d968646af54add6f4b19890c
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

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p1"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.7-p1.tar.gz"
        SHA1
        a3550bae876c3b6ca7c160a2ee583f04cb38207a
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p2"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.7-p2.tar.gz"
        SHA1
        276390a8b41667f0f5c9e298825256cf7ac6a24b
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p3"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.7-p3.tar.gz"
        SHA1
        ee6639485622d0f81163cd2c7ee5c54c89e85482
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p2"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.4-urho-p2.tar.gz"
        SHA1
        0d78d5fa59fb009e3ce9125cc518891889d09451
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p3"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.4-urho-p3.tar.gz"
        SHA1
        4890004c9ba78d5aefe86e75b6197272d535c441
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p4"
        URL
        "https://github.com/hunter-packages/SDL2/archive/v2.0.4-urho-p4.tar.gz"
        SHA1
        580a574f6da1634500448dddf4a73b80c54d168c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL2)
hunter_download(PACKAGE_NAME SDL2)

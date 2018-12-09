# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    EnTT
    VERSION
    v3.x.y-WIP
    URL
    "https://github.com/skypjack/entt/archive/v3.x.y-WIP.tar.gz"
    SHA1
    00f67f43060c1ea2f832e8bfb6d9c170dc84d5b1
)

hunter_cmake_args(
    EnTT
    CMAKE_ARGS
        BUILD_TESTING=OFF
        USE_LIBCPP=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(EnTT)
hunter_download(PACKAGE_NAME EnTT)

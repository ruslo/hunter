# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    WTL
    VERSION
    "9.1.5321"
    URL
    "https://github.com/alamaison/wtl/archive/WTL_9.1_Final-cmake-1.tar.gz"
    SHA1
    9b72747420ebb14ac6ef0d38868031bc277db8d7
)

hunter_add_version(
    PACKAGE_NAME
    WTL
    VERSION
    "9.0.4140"
    URL
    "https://github.com/alamaison/wtl/archive/WTL_9.0_Final-cmake-1.tar.gz"
    SHA1
    c4aba44734520e0a20ae78ccbadf265fcbe5f62c
)

hunter_add_version(
    PACKAGE_NAME
    WTL
    VERSION
    "8.1.12085"
    URL
    "https://github.com/alamaison/wtl/archive/WTL_8.1.12085-cmake-1.tar.gz"
    SHA1
    0e5ff72508cb390e07bf354a101fcca076caeed8
)

hunter_add_version(
    PACKAGE_NAME
    WTL
    VERSION
    "8.0.7161"
    URL
    "https://github.com/alamaison/wtl/archive/WTL_8.0_Final-cmake-1.tar.gz"
    SHA1
    9d0ca0e82fcbfceac8e759c4ffb92127e8846804
)

hunter_add_version(
    PACKAGE_NAME
    WTL
    VERSION
    "7.5.5333"
    URL
    "https://github.com/alamaison/wtl/archive/WTL_7.5_Final-cmake-1.tar.gz"
    SHA1
    c642a99f990c2a7b9a02b06e60cee9bebf5fac39
)

hunter_cmake_args(WTL CMAKE_ARGS BUILD_SAMPLES=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(WTL)
hunter_download(PACKAGE_NAME WTL)

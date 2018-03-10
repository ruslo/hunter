include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Treap
    VERSION
    "0.1"
    URL
    "https://github.com/BinaryTreesImplementation/Treap/archive/v0.1.tar.gz"
    SHA1
    8b745b3c40fc5fb098f61e416d97497f9546f6cd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    hashtable
    CMAKE_ARGS
    BUILD_EXAMPLES=NO
    BUILD_TESTS=NO
)
hunter_cacheable(Treap)
hunter_download(PACKAGE_NAME Treap)


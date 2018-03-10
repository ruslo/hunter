include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    AVL-tree
    VERSION
    "0.4"
    URL
    "https://github.com/BinaryTreesImplementation/AVL-tree/archive/v0.0.123.tar.gz"
    SHA1
    2e783a041027dd81f660a8f7efa1c0119f1a5baa
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    hashtable
    CMAKE_ARGS
    BUILD_EXAMPLES=NO
    BUILD_TESTS=NO
)
hunter_cacheable(AVL-tree)
hunter_download(PACKAGE_NAME AVL-tree)

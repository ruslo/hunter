include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SplayTree
    VERSION
    "0.4"
    URL
    "https://github.com/BinaryTreesImplementation/SplayTree/archive/v0.4.tar.gz"
    SHA1
    7521fc11f5e0e5147ed97124513128bc7689a10d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    hashtable
    CMAKE_ARGS
    BUILD_EXAMPLES=NO
    BUILD_TESTS=NO
)
hunter_cacheable(SplayTree)
hunter_download(PACKAGE_NAME SplayTree)



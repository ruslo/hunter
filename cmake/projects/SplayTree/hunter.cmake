include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SplayTree
    VERSION
    "0.1"
    URL
    "https://github.com/BinaryTreesImplementation/SplayTree/archive/v0.1.tar.gz"
    SHA1
    e2a05501b537f45b05ee54bb4e8635c1a4979452
)

hunter_add_version(
    PACKAGE_NAME
    SplayTree
    VERSION
    ".0.2"
    URL
    "https://github.com/BinaryTreesImplementation/SplayTree/archive/v.0.2.tar.gz"
    SHA1
    e6ac97ffda1638101c68aed473862fd1e14d7660
) 

hunter_cmake_args(
  SplayTree
  CMAKE_ARGS
    NO_SELFTEST=TRUE
)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SplayTree)
hunter_download(PACKAGE_NAME SplayTree)



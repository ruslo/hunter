# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    cryptopp
    VERSION
    "5.6.5-p0"
    URL
    "https://github.com/hunter-packages/cryptopp/archive/v5.6.5-p0.tar.gz"
    SHA1
    4258c9b49c48c433c4aa63629bc896ac9a3902e3
)

hunter_add_version(
    PACKAGE_NAME
    cryptopp
    VERSION
    "5.6.5"
    URL
    "https://github.com/weidai11/cryptopp/archive/CRYPTOPP_5_6_5.tar.gz"
    SHA1
    3aa4f2fcfee05ed304c6614325c90eba0dc75f16
)

hunter_add_version(
    PACKAGE_NAME
    cryptopp
    VERSION
    "5.6.4"
    URL
    "https://github.com/weidai11/cryptopp/archive/CRYPTOPP_5_6_4.tar.gz"
    SHA1
    066e01e704bbdc0f4f785f344c05c8259078a020
)

hunter_cmake_args(
    cryptopp
    CMAKE_ARGS
    BUILD_SHARED=OFF
    BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(cryptopp)
hunter_download(PACKAGE_NAME cryptopp)

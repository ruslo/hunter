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
    fmt
    VERSION
    "3.0.2"
    URL
    "https://github.com/fmtlib/fmt/archive/3.0.2.tar.gz"
    SHA1
    4726b14f05a1d9a1c8a55be5762215c8a3d53786
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "3.0.0"
    URL
    "https://github.com/fmtlib/fmt/releases/download/3.0.0/fmt-3.0.0.zip"
    SHA1
    82ca4625f977ee1e0627ce8421bc52fbbf6e5cc5
)

hunter_cmake_args(
    fmt
    CMAKE_ARGS
        FMT_DOC=OFF
        FMT_TEST=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(fmt)
# Download package.
hunter_download(PACKAGE_NAME fmt)

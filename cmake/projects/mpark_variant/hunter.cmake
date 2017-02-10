# cmake/projects/mpark_variant/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    mpark_variant
    VERSION
    "1.0.0"
    URL
    "https://github.com/mpark/variant/archive/v1.0.0.tar.gz"
    SHA1
    59ab98b61daa335ba1fa613e591de743f72d24b4
)

# Probably more versions for real packages...

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
# Two versions of library will be build by default:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME mpark_variant)

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    OpenCL
    VERSION
    "2.1-p0"
    URL
    "https://github.com/hunter-packages/OpenCL-ICD-Loader/archive/2.1-p0.tar.gz"
    SHA1
    1cb4fed5bc4d0e1583c07e02f43daccab12eb99a
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenCL)
hunter_download(PACKAGE_NAME OpenCL)

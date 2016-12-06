# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...

hunter_add_version(
    PACKAGE_NAME
    OpenCL_Headers
    VERSION
    "2.1-p0"
    URL
    "https://github.com/caseymcc/OpenCL-Headers/archive/2.1-p0.tar.gz"
    SHA1
    25edff7e418331a8cc7ec3d6cf08f39bd525b4a3
)

#hunter_cmake_args(
#    OpenCL_Headers
#    CMAKE_ARGS
#)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenCL_Headers)
hunter_download(PACKAGE_NAME OpenCL_Headers)

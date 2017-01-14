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
    OpenCL-cpp
    VERSION
    "2.0.10-p0"
    URL
   "https://github.com/hunter-packages/OpenCL-CLHPP/archive/2.0.10-p0.tar.gz"
    SHA1
    78a41a5b5e40b9e1cdfb794df446fb4d05edfe42
)

hunter_cmake_args(
    OpenCL-cpp
    CMAKE_ARGS
        BUILD_DOCS=OFF
        BUILD_EXAMPLES=OFF
        BUILD_TESTS=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenCL-cpp)
hunter_download(PACKAGE_NAME OpenCL-cpp)

# cmake/projects/jsoncpp/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    jsoncpp
    VERSION
    "0.7.0"
    URL
    "https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz"
    SHA1
    4fcb0e3275a1391856fc6ae21e36dce866b19393
)

hunter_add_version(
    PACKAGE_NAME
    jsoncpp
    VERSION
    "1.7.7"
    URL
    "https://github.com/open-source-parsers/jsoncpp/archive/1.7.7.tar.gz"
    SHA1
    7bbb47e25b3aa7c4c8b579ca46b32d55f32cb46e
)

# Probably more versions for real packages...

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cmake_args(
    jsoncpp
    CMAKE_ARGS
        JSONCPP_WITH_TESTS=OFF
        JSONCPP_WITH_PKGCONFIG_SUPPORT=OFF
        JSONCPP_WITH_CMAKE_PACKAGE=ON
)

hunter_download(PACKAGE_NAME jsoncpp)

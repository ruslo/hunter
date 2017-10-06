# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

# List of versions here...

hunter_add_version(
    PACKAGE_NAME
    globjects
    VERSION
    "1.1.0-p0"
    URL
    "https://github.com/hunter-packages/globjects/archive/v1.1.0-p0.tar.gz"
    SHA1
    c20c8f9c384802be99b8449b447c0620c603b027
)

hunter_cmake_args(
    globjects
    CMAKE_ARGS
    BUILD_SHARED_LIBS=OFF
    OPTION_BUILD_TESTS=OFF
    OPTION_BUILD_EXAMPLES=OFF
    OPTION_BUILD_TOOLS=OFF
    OPTION_BUILD_DOCS=OFF
    HUNTER_INSTALL_LICENSE_FILES=LICENSE
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(globjects)

# Download package.
# Two versions of library will be build by default:
hunter_download(PACKAGE_NAME globjects)


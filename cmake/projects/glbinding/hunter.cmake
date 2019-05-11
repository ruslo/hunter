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
    glbinding
    VERSION
    "3.0.2-p0"
    URL
    "https://github.com/hunter-packages/glbinding/archive/v3.0.2-p0.tar.gz"
    SHA1
    ef0a1585db171f8321aa620699391d1641443989
)


hunter_add_version(
    PACKAGE_NAME
    glbinding
    VERSION
    "2.1.3-p0"
    URL
    "https://github.com/hunter-packages/glbinding/archive/v2.1.3-p0.tar.gz"
    SHA1
    7bb774ee35f63e7f769d4f4ae6194cbc3f8afe16
)

hunter_cmake_args(
    glbinding
    CMAKE_ARGS
    BUILD_SHARED_LIBS=OFF
    OPTION_BUILD_TESTS=OFF
    OPTION_BUILD_GPU_TESTS=OFF
    OPTION_BUILD_EXAMPLES=OFF
    OPTION_BUILD_TOOLS=OFF
    OPTION_BUILD_DOCS=OFF
    HUNTER_INSTALL_LICENSE_FILES=LICENSE
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(glbinding)

# Download package.
# Two versions of library will be build by default:
hunter_download(PACKAGE_NAME glbinding)


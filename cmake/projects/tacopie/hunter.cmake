# cmake/projects/tacopie/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    tacopie
    VERSION
    "2.4.0-h1"
    URL
    "https://github.com/hunter-packages/tacopie/archive/2.4.0-h1.tar.gz"
    SHA1
    5b326dd4e4792e63d9261682205f32944719bed0
)

hunter_add_version(
    PACKAGE_NAME
    tacopie
    VERSION
    "3.2.0-h1"
    URL
    "https://github.com/hunter-packages/tacopie/archive/3.2.0-h1.tar.gz"
    SHA1
    04a8953bf69f1fa26b68dd76df4b4baea291ab34
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
# Two versions of library will be build by default:
#     * libtacopie.a
#     * libtacopied.a
hunter_cacheable(tacopie)
hunter_download(PACKAGE_NAME tacopie)

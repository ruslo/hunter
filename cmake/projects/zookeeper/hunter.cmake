# cmake/projects/Example/hunter.cmake

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    zookeeper
    VERSION
    "3.4.9-p2"
    URL
    "https://github.com/hunter-packages/zookeeper/archive/3.4.9-p2.tar.gz"
    SHA1
    ed8167bdc0eb08b967e091a4503f3373aad5dddc
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(zookeeper)
hunter_download(PACKAGE_NAME zookeeper)

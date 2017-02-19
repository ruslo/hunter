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
    "3.4.9-p1"
    URL
    "https://github.com/hunter-packages/zookeeper/archive/3.4.9-hunter-6.tar.gz"
    SHA1
    fe68462b58a6eff5688a81e9031fbe32f0acfe74
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(zookeeper)
hunter_download(PACKAGE_NAME zookeeper)

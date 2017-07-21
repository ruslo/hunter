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
    enet
    VERSION
    "1.3.13-p1"
    URL
    "https://github.com/hunter-packages/enet/archive/v1.3.13-p1.tar.gz"
    SHA1
    40f97cc8d5e41f36fab05c9170836fb55d64191e
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(enet)
hunter_download(PACKAGE_NAME enet)

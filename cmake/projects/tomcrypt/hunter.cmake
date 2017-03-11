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
    tomcrypt
    VERSION
    "1.17-p1"
    URL
    "https://github.com/hunter-packages/libtomcrypt/archive/1.17-p1.tar.gz"
    SHA1
    3c9c61ee441b77517525528f5c191fa19801fd30
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(tomcrypt)
hunter_download(PACKAGE_NAME tomcrypt)

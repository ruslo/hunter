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
    tommath
    VERSION
    "1.0-p2"
    URL
    "https://github.com/hunter-packages/libtommath/archive/v1.0-p2.tar.gz"
    SHA1
    733e4644a0b01260830a402b457ca82064fe30cd
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(tommath)
hunter_download(PACKAGE_NAME tommath)

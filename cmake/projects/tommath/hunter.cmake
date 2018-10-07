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
hunter_add_version(
    PACKAGE_NAME
    tommath
    VERSION
    "1.0.1"
    URL
    "https://github.com/t0p4/libtommath/archive/v1.0.1-p1.tar.gz"
    SHA1
    0A581D4DBFC0229712E21A849FE5612C301589F0
)
# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(tommath)
hunter_download(PACKAGE_NAME tommath)

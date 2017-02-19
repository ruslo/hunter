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
    "1.0-p1"
    URL
    "https://github.com/wheybags/libtommath/archive/v1.0_hunter.tar.gz"
    SHA1
    52d0952cb516a67b9f5b66e260a940273cb76e5c
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(tommath)
hunter_download(PACKAGE_NAME tommath)

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
    "https://github.com/hunter-packages/libtommath/archive/v1.0-p1.tar.gz"
    SHA1
    e110b66e1900b0b7a4300d155fb233c729fb208f
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(tommath)
hunter_download(PACKAGE_NAME tommath)

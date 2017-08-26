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
    stormlib
    VERSION
    "9.21-p1"
    URL
    "https://github.com/hunter-packages/StormLib/archive/v9.21-p1.tar.gz"
    SHA1
    db5b811ef5171b163e9abc4d41f1323fb43882a2
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(stormlib)
hunter_download(PACKAGE_NAME stormlib)

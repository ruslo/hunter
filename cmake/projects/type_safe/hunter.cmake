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
    type_safe
    VERSION
    "0.1"
    URL
    "https://github.com/hunter-packages/type_safe/archive/v0.1-p.tar.gz"
    SHA1
    57e426af70791485e2a209c602ce9d71e9d52ab7
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(type_safe)
hunter_download(PACKAGE_NAME type_safe)

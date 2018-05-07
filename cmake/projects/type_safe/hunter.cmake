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

hunter_add_version(
    PACKAGE_NAME
    type_safe
    VERSION
    "0.1-p2"
    URL
    "https://github.com/hunter-packages/type_safe/archive/0.1-p2.tar.gz"
    SHA1
    6a1fa6f3926a5d0175890647ff0f419ba4c562f4
)

hunter_add_version(
    PACKAGE_NAME
    type_safe
    VERSION
    "0.2"
    URL
    "https://github.com/hunter-packages/type_safe/archive/v0.2-p.tar.gz"
    SHA1
    7f8ba49a04f04d7f121ec358521a5d7a8f5039dd
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(type_safe)
hunter_download(PACKAGE_NAME type_safe)

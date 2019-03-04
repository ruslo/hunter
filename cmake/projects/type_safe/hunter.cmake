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

hunter_add_version(
    PACKAGE_NAME
    type_safe
    VERSION
    "0.2-p1"
    URL
    "https://github.com/hunter-packages/type_safe/archive/v0.2-p1.tar.gz"
    SHA1
    d051bec1db05d0623b6e8a6fd2805e70ba914713
)

hunter_add_version(
    PACKAGE_NAME
    type_safe
    VERSION
    "0.2.1-p1"
    URL
    "https://github.com/hunter-packages/type_safe/archive/v0.2.1-p1.zip"
    SHA1
    6d583f877cce781ff472f1a0a2d56af68afa5ff1
)

hunter_add_version(
    PACKAGE_NAME
    type_safe
    VERSION
    "0.2.1-p2"
    URL
    "https://github.com/hunter-packages/type_safe/archive/v0.2.1-p2.zip"
    SHA1
    09a76b0668cd7bf6c6b590c80e64cb2745a32bb9
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects
hunter_cacheable(type_safe)
hunter_download(PACKAGE_NAME type_safe)

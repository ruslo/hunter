# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.2-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.2-p0.tar.gz"
    SHA1
    e1bbc68f2d0fd0e062ba3c716a3a2f137ed0c7b4
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.1-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.1-p0.tar.gz"
    SHA1
    e78acc03a8b86d6209286df1f121755f7bc0bf97
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.0-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.0-p0.tar.gz"
    SHA1
    fa611741b65f0cb26fd9e1900421791b9c311dd6
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "3.0.2-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v3.0.2-p0.tar.gz"
    SHA1
    94c1f2f080a9c9d02b71ba3a57c34a5bd2c74a8c
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "3.0.1-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v3.0.1-p0.tar.gz"
    SHA1
    571d3241e53e6c6282ac068ef169fe94166318b6
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "3.0.0-p0"
    URL
    "https://github.com/hunter-packages/czmq/archive/v3.0.0-p0.tar.gz"
    SHA1
    b5dce40c8239ad1d6dbf87fb96ac3123f1c392d8
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(czmq)
hunter_download(PACKAGE_NAME czmq)

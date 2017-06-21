# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.2-p1"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.2-p1.tar.gz"
    SHA1
    6f0a60bdcccd8cadd8de14eb9562cda4e6b0e0b3
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.1-p2"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.1-p2.tar.gz"
    SHA1
    aa52f864ac9f963634bfa46e48e2372b968cb8ef
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "4.0.0-p2"
    URL
    "https://github.com/hunter-packages/czmq/archive/v4.0.0-p2.tar.gz"
    SHA1
    5644fc0cb17a57431d1fda541cf76cd0a70ab536
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "3.0.2-p1"
    URL
    "https://github.com/hunter-packages/czmq/archive/v3.0.2-p1.tar.gz"
    SHA1
    1824ab64761a09eb9047660afab2eccca4809fa8
)

hunter_add_version(
    PACKAGE_NAME
    czmq
    VERSION
    "3.0.1-p1"
    URL
    "https://github.com/hunter-packages/czmq/archive/v3.0.1-p1.tar.gz"
    SHA1
    a0f85e5a746b9b31204e16f952760bc3f054a433
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(czmq)
hunter_download(PACKAGE_NAME czmq)

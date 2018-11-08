# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    MySQL-client
    VERSION
    "6.1.6"
    URL
    "https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.6-src.tar.gz"
    SHA1
    2444586365c2c58e7ca2397d4617e5fe19f9f246
)

hunter_add_version(
    PACKAGE_NAME
    MySQL-client
    VERSION
    "6.1.9"
    URL
    "https://github.com/hunter-packages/mysql-client/archive/v1.6.9.tar.gz"
    SHA1
    3268345d8e324d11380cd26475e1669bc5ff2fa0
)

hunter_add_version(
    PACKAGE_NAME
    MySQL-client
    VERSION
    "6.1.9-p0"
    URL
    "https://github.com/hunter-packages/mysql-client/archive/v1.6.9-p0.tar.gz"
    SHA1
    64c3fb0500e03fc0ee188dca1ec33e52c2f54e32
)

hunter_add_version(
    PACKAGE_NAME
    MySQL-client
    VERSION
    "6.1.9-p1"
    URL
    "https://github.com/hunter-packages/mysql-client/archive/v1.6.9-p1.tar.gz"
    SHA1
    8c9d00495194955529e4b1074d5bafba9e0882a1
)

# https://github.com/ruslo/hunter/issues/705
# hunter_cacheable(MySQL-client)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME MySQL-client)

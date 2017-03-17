# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_package)
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.0"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.0.tar.gz"
    SHA1
    dc914aca55469c275cf59d23ddd95b7054d02420
)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.1"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.1.tar.gz"
    SHA1
    813fe329768ab0e2297b6752ac8c016e263dbfe6
)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.2"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.2.tar.gz"
    SHA1
    34f3986fe41eee52bd4c50f8b7d9552c1763bb9d
)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.3"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.3.tar.gz"
    SHA1
    aba5222e86561e34795c3602e43923c27df13b56
)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.4"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.4.tar.gz"
    SHA1
    b83728f082dcf9cde7fc291e6745cd7f4edcdbc5
)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.6"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.6.tar.gz"
    SHA1
    390df257a5b22087c96f67a08b52902e7dea1bc2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Leathers)

# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.1.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.1.0.tar.gz"
    SHA1
    6944f77d5eb61c067acebf06231a29b90963b7c0
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.1.1
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.1.1.tar.gz"
    SHA1
    4993b09855e51047ea51136a05fcd6d0216f2716
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.1.2
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.1.2.tar.gz"
    SHA1
    43e56210b7f42bd83bb15a91acb1f940037da329
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.2.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.2.0.tar.gz"
    SHA1
    1e5705ce502b2794a5bc13bbd7964e9c0010fa25
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.3.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.3.0.tar.gz"
    SHA1
    7d2fd034f49e679f114e620d0bd1ade0c4f59df9
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.3.1
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.3.1.tar.gz"
    SHA1
    60a1c9eafe02259d262a2d44ad784878db9de740
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.3.2
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.3.2.tar.gz"
    SHA1
    8994a92cc42a099bd3e19656acb939d9a53fd926
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.3.3
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.3.3.tar.gz"
    SHA1
    b9e047217b27b4e5ee9e85e51a13ef391550e8eb
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.4.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.4.0.tar.gz"
    SHA1
    5b8da33fed8f5eacbc884318c88f3f50a7a59bb6
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.5.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.5.0.tar.gz"
    SHA1
    3fff909740e22ce789c57eba7eb35dce916957b3
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.6.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.6.0.tar.gz"
    SHA1
    be82af13be82d92809fb0d132b9d7e554d06c07b
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.7.0
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.7.0.tar.gz"
    SHA1
    88261e2d68654659323ef452bccdad10766575d4
)

hunter_add_version(
    PACKAGE_NAME
    gauze
    VERSION
    0.7.1
    URL
    "https://github.com/hunter-packages/gauze/archive/v0.7.1.tar.gz"
    SHA1
    858ccd32c2e9901df7c19757aa3f742b49b78ed2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gauze)
hunter_cmake_args(gauze CMAKE_ARGS GAUZE_BUILD_TESTS=OFF)
hunter_download(PACKAGE_NAME gauze)

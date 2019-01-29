# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_sdk_tools_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_sdk_tools_packer/archive/v1.0.0.tar.gz"
    SHA1
    cff5f8931e74f3635b94282c7e0958fdd8cb740e
)

hunter_add_version(
    PACKAGE_NAME
    android_sdk_tools_packer
    VERSION
    1.0.1
    URL
    "https://github.com/hunter-packages/android_sdk_tools_packer/archive/v1.0.1.tar.gz"
    SHA1
    06f6788c558ee5891d07301208260fbc64545768
)

hunter_add_version(
    PACKAGE_NAME
    android_sdk_tools_packer
    VERSION
    1.0.2
    URL
    "https://github.com/hunter-packages/android_sdk_tools_packer/archive/v1.0.2.tar.gz"
    SHA1
    486140b9a3db1610aba7fcbda8474f2d97d40072
)

hunter_add_version(
    PACKAGE_NAME
    android_sdk_tools_packer
    VERSION
    1.0.3
    URL
    "https://github.com/hunter-packages/android_sdk_tools_packer/archive/v1.0.3.tar.gz"
    SHA1
    71a497152e3e1efe535df2c30210596e91042ecf
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_sdk_tools_packer)
hunter_download(PACKAGE_NAME android_sdk_tools_packer)

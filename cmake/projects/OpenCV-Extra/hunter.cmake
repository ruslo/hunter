# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "4.0.0"
    URL
    "https://github.com/opencv/opencv_contrib/archive/4.0.0.tar.gz"
    SHA1
    4c10c8cb288a320b47ec7e87a0fdcf5a8df0f49d
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.4.3"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.4.3.tar.gz"
    SHA1
    2c70868a9c2accae23e8f382885d3e4f97030978
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.4.2"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.4.2.tar.gz"
    SHA1
    34dcdd3a77f24271d5615837a2e253af1922c1ea
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.4.1"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.4.1.tar.gz"
    SHA1
    638d6f0e0afe0fef511c0889c766f3350457ca94
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.4.0"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.4.0.tar.gz"
    SHA1
    e7ba971a30fe85e87de606d8cdf3b3bf4cc3da14
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.3.1"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.3.1.tar.gz"
    SHA1
    3c9167e14af097762f1d689355929c964260ada1
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.3.0"
    URL
    "https://github.com/opencv/opencv_contrib/archive/3.3.0.tar.gz"
    SHA1
    d97d80f8887416f4d8353f10fc4812a21909f84a
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.2.0"
    URL
    "https://github.com/Itseez/opencv_contrib/archive/3.2.0.tar.gz"
    SHA1
    fa8ac06b8f6ad0a290106077f64b2a886055fd53
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV-Extra
    VERSION
    "3.0.0"
    URL
    "https://github.com/Itseez/opencv_contrib/archive/3.0.0.tar.gz"
    SHA1
    6301ce49ec0c851837b62aed8592be9cd9309f79
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME OpenCV-Extra)

# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(Eigen)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.4-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.4-p0.tar.gz"
    SHA1
    49dee30c5fedd8613a144f9bf6551fb46bb69e92
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.3-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.3-p0.tar.gz"
    SHA1
    ed46aa311d2f6bc9dae06c3ac39cc53677e61400
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.2-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.2-p0.tar.gz"
    SHA1
    b6bc33bb1acb0f853cc2b4e0c26d947bca510e1a
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.1-p3"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.1-p3.tar.gz"
    SHA1
    874fc1fb141f9fcd8537b4384c04b4e67ab3821f
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.1-p2"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.1-p2.tar.gz"
    SHA1
    0a15d912c3002bfb42e739235cfd650ab74bb5a6
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.1-p4"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.1-p4.tar.gz"
    SHA1
    3ea6a95fb3b1b82c9a9c75fb50f5c87f7e0c9b1a
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "v0.0.0-429aa5254200-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/hunter-429aa5254200-p0.tar.gz"
    SHA1
    89e7e4419142f7a06fc59183f61c1f9333f2633b
)

set(_android_args)
if(ANDROID)
  set(_android_args EIGEN_DISABLE_CXX11_MATH=YES)
endif()

# disable Eigen tests. Testcreation tries to find package 'Boost'
hunter_cmake_args(
    Eigen
    CMAKE_ARGS
    BUILD_TESTING=OFF
    HUNTER_INSTALL_LICENSE_FILES=COPYING.MPL2
    ${_android_args}
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME Eigen)

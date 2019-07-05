# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_check_toolchain_definition)

# Disable searching in locations not specified by these hint variables.
set(Boost_NO_SYSTEM_PATHS ON)

# use base url for official boost releases
set(_hunter_boost_base_url "https://dl.bintray.com/boostorg/release")

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.65.1"
    URL
    "${_hunter_boost_base_url}/1.65.1/source/boost_1_65_1.tar.bz2"
    SHA1
    4a5b0c3c1b1b9a4d6cb6a6cc395e903e76f76720
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.65.0"
    URL
    "${_hunter_boost_base_url}/1.65.0/source/boost_1_65_0.tar.bz2"
    SHA1
    f9260074ecfb31f3e65322fae9c15cc423c0ad59
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.66.0"
    URL
    "${_hunter_boost_base_url}/1.66.0/source/boost_1_66_0.7z"
    SHA1
    075d0b43980614054b1f1bafd189f863bba6600e
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.66.0-p0"
    URL
    "https://github.com/hunter-packages/boost/releases/download/v1.66.0-p0/hunter-1.66.0.7z"
    SHA1
    8c9829ce5e8f0b2b582f8ee1a6103c037a154aa3
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.67.0"
    URL
    "${_hunter_boost_base_url}/1.67.0/source/boost_1_67_0.7z"
    SHA1
    64c278c23defe155e630a307ae2c0615348b14b3
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.67.0-p0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.67.0-p0.tar.gz"
    SHA1
    e56a5fbafa31683047f92850e05735dfcde084aa
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.67.0-p1"
    URL
    "https://github.com/hunter-packages/boost/releases/download/v1.67.0-p1/hunter-1.67.0.7z"
    SHA1
    26fcf19a79d013a318562435cef2829ea6bf29a4
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.68.0-p0"
    URL
    "https://github.com/hunter-packages/boost/releases/download/v1.68.0-p0/hunter-1.68.0.7z"
    SHA1
    3af972569d4b685145442445e51b3fcace342b31
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.68.0-p1"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.68.0-p1.tar.gz"
    SHA1
    0bb10b0a0fdc196646c87e0143c0290baa32357d
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.69.0-p0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.69.0-p0.tar.gz"
    SHA1
    2539b0751f77ff3efdf842775700fe5422c2adfb
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.69.0-p1"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.69.0-p1.tar.gz"
    SHA1
    7f3a890d698912516f45effb3c88a8b6f93ed2da
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.70.0-p0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.70.0-p0.tar.gz"
    SHA1
    e6bb97b5109c7c15ea459cf2b1a9d52cbf88a89e
)

# up until 1.63 sourcefourge was used
set(_hunter_boost_base_url "https://downloads.sourceforge.net/project/boost/boost/")
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.64.0"
    URL
    "${_hunter_boost_base_url}/1.64.0/boost_1_64_0.tar.bz2"
    SHA1
    51421ef259a4530edea0fbfc448460fcc5c64edb
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.63.0"
    URL
    "${_hunter_boost_base_url}/1.63.0/boost_1_63_0.tar.bz2"
    SHA1
    9f1dd4fa364a3e3156a77dc17aa562ef06404ff6
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.62.0"
    URL
    "${_hunter_boost_base_url}/1.62.0/boost_1_62_0.tar.bz2"
    SHA1
    5fd97433c3f859d8cbab1eaed4156d3068ae3648
)


hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.61.0"
    URL
    "${_hunter_boost_base_url}/1.61.0/boost_1_61_0.tar.bz2"
    SHA1
    f84b1a1ce764108ec3c2b7bd7704cf8dfd3c9d01
)

# Version without tests and docs
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.60.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.60.0.tar.gz"
    SHA1
    28a5b0f739114fde5d4ed1d7f52e5b6cf13fe54a
)

# Version without tests and docs
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.59.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.59.0.tar.gz"
    SHA1
    28db0e54f9e55ff1230903704836e035f7227fd5
)

# Version without tests and docs
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0-p1"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.58.0-p1.tar.gz"
    SHA1
    bc417f98b644f244121c0eb47e810b4c6a6277e8
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0-p0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.58.0-p0.tar.gz"
    SHA1
    0c3a2f284e85a61e2d2ccc1a6fdc8dc7a443ef67
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.bz2/download"
    SHA1
    2fc96c1651ac6fe9859b678b165bd78dc211e881
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.57.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.57.0.tar.gz"
    SHA1
    9305649224848860664893342ac29709ebcf42f9
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.56.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.56.0.tar.gz"
    SHA1
    08a45c69e90e5ddc485b770a573dbace8e48932e
)

# Remove docs and tests
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched-3"
    URL
    "https://github.com/hunter-packages/boost/archive/1.55.0-patched-3.tar.gz"
    SHA1
    4ae01023ac0dc68570fd1bbcf67cbcd839df04eb
)

# Apply fix for: https://svn.boost.org/trac/boost/ticket/9332
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched-2"
    URL
    "http://sourceforge.net/projects/hunter-packages/files/boost_1_55_0-patched-2.tar.bz2/download"
    SHA1
    38c0523dbd27ed6b363ad9255548e942d404b39e
)

# Workaround for: https://svn.boost.org/trac/boost/ticket/9610
# http://boost.2283326.n4.nabble.com/config-clang-int128-support-td4653826.html
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched"
    URL
    "http://sourceforge.net/projects/hunter-packages/files/boost_1_55_0-patched.tar.bz2/download"
    SHA1
    308adf99dbdf0668c9695ff1da075a9e3b71be9d
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download"
    SHA1
    cef9a0cc7084b1d639e06cd3bc34e4251524c840
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.54.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.54.0/boost_1_54_0.tar.bz2/download"
    SHA1
    230782c7219882d0fab5f1effbe86edb85238bf4
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.53.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.53.0/boost_1_53_0.tar.bz2/download"
    SHA1
    e6dd1b62ceed0a51add3dda6f3fc3ce0f636a7f3
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.52.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.52.0/boost_1_52_0.tar.bz2/download"
    SHA1
    cddd6b4526a09152ddc5db856463eaa1dc29c5d9
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.51.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.51.0/boost_1_51_0.tar.bz2/download"
    SHA1
    52ef06895b97cc9981b8abf1997c375ca79f30c5
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.50.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.50.0/boost_1_50_0.tar.bz2/download"
    SHA1
    ee06f89ed472cf369573f8acf9819fbc7173344e
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.49.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download"
    SHA1
    26a52840e9d12f829e3008589abf0a925ce88524
)

if(MSVC)
  hunter_check_toolchain_definition(NAME "_DLL" DEFINED _hunter_vs_md)
  hunter_cmake_args(
    Boost
    CMAKE_ARGS
      BOOST_BUILD_DYNAMIC_VSRUNTIME=${_hunter_vs_md}
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_boost)
hunter_cacheable(Boost)
hunter_download(PACKAGE_NAME Boost PACKAGE_INTERNAL_DEPS_ID "43")

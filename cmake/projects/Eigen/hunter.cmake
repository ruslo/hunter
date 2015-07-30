# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_ 1)
endif()

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
    "3.2.4-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.2.4-p0.tar.gz"
    SHA1
    6fd638939dfd3a3be1cf0ea920160591ed60f76d
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.2.4"
    URL
    "https://bitbucket.org/eigen/eigen/get/3.2.4.tar.gz"
    SHA1
    b826f665bdfe31784795eef79c75540db71ab702
)

hunter_cmake_args(Eigen CMAKE_ARGS EIGEN_ENABLE_TESTING=OFF)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME Eigen)

# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
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

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME Eigen)

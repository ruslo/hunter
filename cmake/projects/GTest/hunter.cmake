# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GTEST_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GTEST_HUNTER_CMAKE 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)

# Add dependencies
hunter_add_package(Sugar)

hunter_add_version_start(GTest)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter.tar.gz"
    SHA1
    1ed1c26d11fb592056c1cb912bd3c784afa96eaa
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-1"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-1.tar.gz"
    SHA1
    0cb1dcf75e144ad052d3f1e4923a7773bf9b494f
)

hunter_download(
    PACKAGE_NAME
    GTest
    DEPENDS
    Sugar
    DOWNLOAD_SCHEME
    url_sha1_release_debug
)

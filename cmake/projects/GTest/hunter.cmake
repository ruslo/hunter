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
    "1.7.0-sugar"
    URL
    "https://github.com/ruslo/gtest/archive/v1.7.0-sugar.tar.gz"
    SHA1
    1e26514f8ab324658fc4bb9e872e159794b215ae
)

hunter_download(
    PACKAGE_NAME
    GTest
    DEPENDS
    Sugar
    DOWNLOAD_SCHEME
    url_sha1_release_debug
)

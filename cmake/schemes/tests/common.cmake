# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.8)

set(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../..")
include(${HUNTER_ROOT}/cmake/Hunter)

include(${CMAKE_CURRENT_LIST_DIR}/utilities.cmake)

# rewrite base for testing
set(HUNTER_BASE ${PROJECT_BINARY_DIR}/_hunter_base)

# temp project location
set(DOWNLOAD_PROJECT_BASE ${PROJECT_BINARY_DIR}/_download)

# describe test download project (URL and SHA1 defined in test CMakeLists.txt)
set(HUNTER_PACKAGE_NAME dotest)
set(HUNTER_INSTALL_TAG test_default)

# set EP_BASE directory
set(HUNTER_PACKAGE_INSTALL_DIR ${HUNTER_BASE}/Install)
set(HUNTER_PACKAGE_DOWNLOAD_DIR ${HUNTER_BASE}/Download/${HUNTER_PACKAGE_NAME})
set(HUNTER_PACKAGE_SOURCE_DIR ${HUNTER_BASE}/Source/${HUNTER_PACKAGE_NAME})

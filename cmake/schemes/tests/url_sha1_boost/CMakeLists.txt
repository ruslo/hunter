# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
)

set(
    HUNTER_PACKAGE_SHA1
    cef9a0cc7084b1d639e06cd3bc34e4251524c840
)

configure_file(
    ${HUNTER_ROOT}/cmake/schemes/url_sha1_boost.cmake.in
    ${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt
    @ONLY
)

execute_test(${CMAKE_COMMAND} .)
execute_test(${CMAKE_COMMAND} --build .)

if(NOT EXISTS ${HUNTER_PACKAGE_INSTALL_DIR}/include/boost/config.hpp)
  message(FATAL_ERROR "Install failed")
endif()

if(EXISTS ${HUNTER_PACKAGE_INSTALL_DIR}/lib)
  message(FATAL_ERROR "Some libs installed")
endif()

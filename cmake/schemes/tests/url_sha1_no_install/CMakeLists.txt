# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    "https://github.com/forexample/example-A/archive/v1.0.1.tar.gz"
)
set(HUNTER_PACKAGE_SHA1 48179067d11828dc347f98fc148654f88766529d)

configure_file(
    "${HUNTER_ROOT}/Source/cmake/schemes/url_sha1_no_install.cmake.in"
    "${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt"
    @ONLY
)

execute_test("${CMAKE_COMMAND}" .)
execute_test("${CMAKE_COMMAND}" --build .)

if(EXISTS "${HUNTER_PACKAGE_INSTALL_DIR}")
  hunter_fatal_error("Install dir still exists!")
endif()

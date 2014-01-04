# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)
project(download_test)

include(../common.cmake)

set(
    HUNTER_PACKAGE_URL
    "https://github.com/forexample/example-A/archive/v1.0.1.tar.gz"
)
set(HUNTER_PACKAGE_SHA1 48179067d11828dc347f98fc148654f88766529d)

set(HUNTER_DOWNLOAD_SCHEME_VARIANTS release debug)

configure_file(
    "${HUNTER_ROOT}/Source/cmake/schemes/url_sha1_release_debug.cmake.in"
    "${DOWNLOAD_PROJECT_BASE}/CMakeLists.txt"
    @ONLY
)

set(toolchain "${DOWNLOAD_PROJECT_BASE}/toolchain.cmake")

execute_process(
    COMMAND
    "${CMAKE_COMMAND}" -E touch "${toolchain}"
)

execute_test("${CMAKE_COMMAND}" "-DCMAKE_TOOLCHAIN_FILE=${toolchain}" .)
execute_test("${CMAKE_COMMAND}" --build .)

check_installed_static_lib(example_A)

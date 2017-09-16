# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ceres-solver)
# build LAPACK as shared library
#hunter_config(LAPACK
#  VERSION ${HUNTER_LAPACK_VERSION}
#  CMAKE_ARGS BUILD_SHARED_LIBS=ON
#)
# as alternative build LAPACK as static lib by removing the above lines from config.cmake
# If doing so you need to enable Fortran support
# enable_language(Fortran)
# build LAPACK as shared library

hunter_add_package(ceres-solver)

find_package(Ceres CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ceres)


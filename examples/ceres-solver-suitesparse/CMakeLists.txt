# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ceres-solver)
# enable Fortran support, needed for LAPACK static libs
enable_language(Fortran)
# as alternative LAPACK can be built as shared lib by adding
# the following lines to config.cmake (uncommented)
#hunter_config(LAPACK
#  VERSION ${HUNTER_LAPACK_VERSION}
#  CMAKE_ARGS BUILD_SHARED_LIBS=ON
#)

hunter_add_package(ceres-solver)

find_package(Ceres CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ceres)


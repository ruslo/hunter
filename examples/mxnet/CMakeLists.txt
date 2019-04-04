# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mxnet)

# DOCUMENTATION_START {
hunter_add_package(mxnet)
find_package(mxnet CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC mxnet::mxnet)
# DOCUMENTATION_END }

# To test 'boo' executable:
#
# > cd _testing/_builds/.../
# > ls boo
# boo
# > wget https://raw.githubusercontent.com/apache/incubator-mxnet/5b86701f2bad8ea5d9b0fc1df88ef0077a70ffb8/cpp-package/example/get_data.sh
# > chmod +x get_data.sh
# > ./get_data.sh
# > LD_LIBRARY_PATH=/.../hunter/_testing/Hunter/_Base/.../Install/lib ./boo 10

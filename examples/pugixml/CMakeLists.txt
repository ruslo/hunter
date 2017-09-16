# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-pugixml)

# download pugixml
hunter_add_package(pugixml)

# now pugixml can be used
find_package(pugixml CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CXX_STANDARD_REQUIRED ON)
add_executable(example main.cpp)
target_link_libraries(example pugixml)

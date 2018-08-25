
# by Cyberunner23
# for the Hunter project

cmake_minimum_required(VERSION 3.0)

variable_watch(HUNTER_TCLAP_VERSION)

include("../common.cmake")

project(example-TCLAP)

# DOCUMENTATION_START { 
hunter_add_package(TCLAP)
find_package(TCLAP CONFIG REQUIRED)

add_executable(foo main.cpp)
target_link_libraries(foo TCLAP::TCLAP)
# DOCUMENTATION_END } 


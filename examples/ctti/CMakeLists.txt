cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ctti)

# DOCUMENTATION_START {
hunter_add_package(ctti)
find_package(ctti CONFIG REQUIRED)

add_executable(ctti_test main.cpp)
target_link_libraries(ctti_test ctti::ctti)
# DOCUMENTATION_END } 

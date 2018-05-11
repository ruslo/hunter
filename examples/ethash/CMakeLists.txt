cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(use-ethash)

# DOCUMENTATION_START {
hunter_add_package(ethash)
find_package(ethash CONFIG REQUIRED)

add_executable(use_ethash main.cpp)
target_link_libraries(use_ethash ethash::ethash)
# DOCUMENTATION_END }
cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(CLI11-example)

# DOCUMENTATION_START {
hunter_add_package(CLI11)
find_package(CLI11 CONFIG REQUIRED)

add_executable(CLI11-example main.cpp)
target_link_libraries(CLI11-example CLI11::CLI11)
# DOCUMENTATION_END }

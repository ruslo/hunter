cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-CreateLaunchers)

# DOCUMENTATION_START {
hunter_add_package(CreateLaunchers)
find_package(CreateLaunchers CONFIG REQUIRED)

add_executable(CreateLaunchers_test main.cpp)

include(CreateLaunchers)

create_target_launcher(CreateLaunchers_test
    ARGS "-a"
    RUNTIME_LIBRARY_DIRS "./"
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
)

# DOCUMENTATION_END }

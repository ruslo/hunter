cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-termcolor)

# DOCUMENTATION_START {
hunter_add_package(termcolor)
find_package(termcolor CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC termcolor::termcolor)
# DOCUMENTATION_END }

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_fastnoisesimd)

# DOCUMENTATION_START {
hunter_add_package(FastNoiseSIMD)
find_package(FastNoiseSIMD CONFIG REQUIRED)

add_executable(fastnoisesimd_test main.cpp)
target_link_libraries(fastnoisesimd_test FastNoiseSIMD::fastNoise)
# DOCUMENTATION_END } 

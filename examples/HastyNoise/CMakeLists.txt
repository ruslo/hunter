cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_hastynoisesimd)

# DOCUMENTATION_START {
hunter_add_package(HastyNoise)
find_package(HastyNoise CONFIG REQUIRED)

add_executable(hastynoise_test main.cpp)
target_link_libraries(hastynoise_test HastyNoise::hastyNoise)
# DOCUMENTATION_END } 

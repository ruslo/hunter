cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_wt)

# DOCUMENTATION_START {
hunter_add_package(wt)
find_package(wt CONFIG REQUIRED)

add_executable(wt_test main.cpp)
target_link_libraries(wt_test Wt::Wt Wt::HTTP)
# DOCUMENTATION_END } 

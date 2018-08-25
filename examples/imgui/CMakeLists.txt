cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_imgui)

# DOCUMENTATION_START {
hunter_add_package(imgui)
find_package(imgui CONFIG REQUIRED)

add_executable(imgui_test main.cpp)
target_link_libraries(imgui_test imgui::imgui)
# DOCUMENTATION_END } 

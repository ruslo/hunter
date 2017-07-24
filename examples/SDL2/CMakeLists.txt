cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL2-test)

hunter_add_package(SDL2)
find_package(SDL2 CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
    SDL2::SDL2main
    SDL2::SDL2)

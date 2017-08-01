cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL_mixer-test)

hunter_add_package(SDL_mixer)
find_package(SDL_mixer CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
    SDL_mixer::SDL_mixer
    SDL2::SDL2main)

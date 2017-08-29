cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL_image-test)

hunter_add_package(SDL_image)
find_package(SDL_image CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
    SDL_image::SDL_image
    SDL2::SDL2main)

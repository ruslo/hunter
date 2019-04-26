cmake_minimum_required (VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL2-test)

hunter_add_package(SDL2)
find_package(SDL2 CONFIG REQUIRED)

if(ANDROID)
  add_library(main SHARED main.cpp)
elseif(IOS)
  # FIXME
  add_library(main dummy.cpp)
else()
  add_executable(main main.cpp)
endif()

target_link_libraries(main
    SDL2::SDL2main
    SDL2::SDL2)

cmake_minimum_required(VERSION 3.0)
project(libsodium-example)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

hunter_add_package(libsodium)
find_package(libsodium CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main libsodium::libsodium)
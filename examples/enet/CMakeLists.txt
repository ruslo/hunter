cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-enet)

hunter_add_package(enet)

find_package(enet CONFIG REQUIRED)

add_executable(example-enet main.c)
target_link_libraries(example-enet enet::enet)

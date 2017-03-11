cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-libtomcrypt)

hunter_add_package(tomcrypt)

find_package(tomcrypt CONFIG REQUIRED)

add_executable(example-libtomcrypt main.c)
target_link_libraries(example-libtomcrypt tomcrypt::tomcrypt)

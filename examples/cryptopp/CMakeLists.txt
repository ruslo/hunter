cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cryptopp)

hunter_add_package(cryptopp)
find_package(cryptopp CONFIG REQUIRED)


add_executable(cryptopp-test main.cpp)


target_link_libraries(cryptopp-test PRIVATE cryptopp-static)

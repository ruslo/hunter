cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(libscrypt-test)

# DOCUMENTATION_START {
hunter_add_package(libscrypt)
find_package(libscrypt CONFIG REQUIRED)

add_executable(libscrypt_test main.cpp)
target_link_libraries(libscrypt_test libscrypt::scrypt)
# DOCUMENTATION_END }

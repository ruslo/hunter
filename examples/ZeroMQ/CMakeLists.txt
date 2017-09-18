cmake_minimum_required(VERSION 3.2)

# This is optional and sets zeromq to use the newer version 4.2.3 (not-default version)
# which breaks some API with 4.1.4 (default version) but improves compatibility for windows
set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ZeroMQ)

hunter_add_package(ZeroMQ)

find_package(ZeroMQ CONFIG REQUIRED)

add_executable(version main.cpp)
target_link_libraries(version ZeroMQ::libzmq)

add_executable(version-static main.cpp)
target_link_libraries(version-static ZeroMQ::libzmq-static)

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-zookeeper)

hunter_add_package(zookeeper)

find_package(zookeeper CONFIG REQUIRED)

add_executable(cli main.c)
target_link_libraries(cli zookeeper::zookeeper_mt)
#target_link_libraries(cli zookeeper::zookeeper_st) # if you want the single-threaded lib instead

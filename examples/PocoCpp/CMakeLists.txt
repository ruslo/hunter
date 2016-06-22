cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-PocoCpp)

hunter_add_package(PocoCpp)
find_package(Poco REQUIRED Foundation Util CONFIG)

add_executable(hello-poco hello-poco.cpp)
target_link_libraries(hello-poco Poco::Foundation Poco::Util)

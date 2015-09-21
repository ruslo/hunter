cmake_minimum_required (VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(dowload-nlohmann-json)

hunter_add_package(nlohmann-json)
find_package(nlohmann-json)

add_executable(main main.cpp)

target_link_libraries(main
  nlohmann-json::nlohmann-json)
set_target_properties(main PROPERTIES
  COMPILE_FLAGS ${NLOHMANN_JSON_DEFINITIONS})

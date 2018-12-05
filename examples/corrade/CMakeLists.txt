# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-corrade)

# DOCUMENTATION_START {
set(components Containers Interconnect PluginManager TestSuite Utility)

foreach(comp ${components})
  list(APPEND components_with_prefix Corrade::${comp})
endforeach()

hunter_add_package(corrade)
find_package(Corrade CONFIG REQUIRED COMPONENTS ${components})

add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE ${components_with_prefix})
# DOCUMENTATION_END }

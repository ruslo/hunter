cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ChaiScript)

# DOCUMENTATION_START {
hunter_add_package(chaiscript)
find_package(chaiscript CONFIG REQUIRED)

add_executable(chaitest main.cpp)
target_link_libraries(chaitest chaiscript::chaiscript) 
# DOCUMENTATION_END }

if (CYGWIN OR MINGW)
    # set O3 to avoid a bigObj issue
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif()


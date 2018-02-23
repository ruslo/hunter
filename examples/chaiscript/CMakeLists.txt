cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ChaiScript)

# DOCUMENTATION_START {
hunter_add_package(chaiscript)
find_package(chaiscript CONFIG REQUIRED)
# DOCUMENTATION_END }

if (CMAKE_HOST_WIN32 AND (CYGWIN OR MINGW)) 
    # set O3 to avoid a bigObj issue
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif()

get_property(chaiscript_so_path TARGET chaiscript::chaiscript PROPERTY LOCATION)
message("Chaiscript PATH:  ${chaiscript_so_path}")

add_executable(chaitest main.cpp)
target_link_libraries(chaitest chaiscript::chaiscript) #parser chaiscript::stdlib chaiscript::stl_extra)

enable_testing()
file(COPY ${chaiscript_so_path} DESTINATION ${CMAKE_BINARY_DIR})
add_test(chaitest chaitest)

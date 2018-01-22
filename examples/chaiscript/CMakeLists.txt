cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ChaiScript)

# DOCUMENTATION_START {
hunter_add_package(chaiscript)
find_package(chaiscript CONFIG REQUIRED)
# DOCUMENTATION_END }

if (CMAKE_HOST_UNIX) 
    #set unix link libraries
    list(APPEND LIBS "dl") 
    list(APPEND LIBS "pthread")
#    list(APPEND LIBS "readline")
    add_definitions(-pthread)
endif()
if (CMAKE_HOST_WIN32) 
    # set O3 to avoid a bigObj issue
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif()

add_executable(chaitest main.cpp)
target_link_libraries(chaitest ${LIBS} chaiscript::parser chaiscript::stdlib)


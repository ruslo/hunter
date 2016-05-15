# Added by Thiago Bastos, 2016

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-glm)

hunter_add_package(GLM)

find_package(GLM REQUIRED)
include_directories(${GLM_INCLUDE_DIRS})

add_executable(foo foo.cpp)

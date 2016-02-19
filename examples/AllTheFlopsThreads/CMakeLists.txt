# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-alltheflopsthreads)

# download alltheflopsthreads
hunter_add_package(AllTheFlopsThreads)

# now alltheflopsthreads can be used
find_package(AllTheFlopsThreads CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo AllTheFlopsThreads::all_the_flops_threads)

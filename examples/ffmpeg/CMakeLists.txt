# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ffmpeg)

# DOCUMENTATION_START {
hunter_add_package(ffmpeg)
find_package(ffmpeg CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(
    boo
    PUBLIC
    ffmpeg::avcodec
    ffmpeg::avformat
    ffmpeg::avutil
    ffmpeg::swresample
    ffmpeg::swscale
)
# DOCUMENTATION_END }

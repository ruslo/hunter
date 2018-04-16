# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sources_for_android_sdk_packer)

# DOCUMENTATION_START {
hunter_add_package(sources_for_android_sdk_packer)
# DOCUMENTATION_END }

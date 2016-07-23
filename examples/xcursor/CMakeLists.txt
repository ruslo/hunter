# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xcursor)

# download xcursor
hunter_add_package(xcursor)

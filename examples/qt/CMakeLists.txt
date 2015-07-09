# Copyright (c) 2015, Alexandre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(use-qt)

hunter_add_package(Qt)
#find_package(Qt REQUIRED)



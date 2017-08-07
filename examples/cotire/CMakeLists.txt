# Copyright (c) 2017, Pawel Bylica
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cotire)

# download cotire
hunter_add_package(cotire)
message(${COTIRE_ROOT})

# This works, but is quite ugly. Can we get include(cotire) to work?
include(${COTIRE_ROOT}/cotire.cmake)

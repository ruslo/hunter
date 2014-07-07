# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)
project(download-sugar)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_SELF}/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download sugar
hunter_add_package(Sugar)

# now sugar can be used
include("${SUGAR_ROOT}/cmake/Sugar")
include(sugar_status_print)

# try some function
set(SUGAR_STATUS_PRINT ON)
sugar_status_print("Sugar downloaded!")

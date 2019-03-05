# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

# Mimic Travis environment for testing {
set(ENV{TRAVIS_TAG} "v1.0.0")
# }

# DOCUMENTATION_START {
project(foo VERSION 1.0.0)

hunter_add_package(check_ci_tag)
find_package(check_ci_tag CONFIG REQUIRED)

# Read environment variables like TRAVIS_TAG/APPVEYOR_REPO_TAG_NAME
# and check they match PROJECT_VERSION
check_ci_tag()
# DOCUMENTATION_END }

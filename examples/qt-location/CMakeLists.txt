cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-location)

hunter_add_package(Qt COMPONENTS qtlocation)

find_package(Qt5Positioning REQUIRED)
find_package(Qt5Location REQUIRED)

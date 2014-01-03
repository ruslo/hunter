# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)
project(download-boost)

if(NOT XCODE_VERSION)
  message(FATAL_ERROR "Xcode only")
endif()

set(CMAKE_BUILD_TYPE Debug)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_ROOT}/Source/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download boost
hunter_add_package(Sugar) # get resources and plist from examples
hunter_add_package(Boost COMPONENTS filesystem system test regex)

# use sugar
include(${SUGAR_ROOT}/cmake/Sugar)
include(sugar_include)
include(sugar_mark_macosx_resources)
include(sugar_set_xcode_ios_sdkroot)

# use boost
find_package(
    Boost
    1.55
    REQUIRED
    filesystem
    regex
    system
    unit_test_framework
)
include_directories(${Boost_INCLUDE_DIRS})

# prepare resources for target
set(PLIST_FILE "${SUGAR_ROOT}/examples/plist/ios/empty.plist.in")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.hunter.ios.EmptyApplication")
sugar_include("${SUGAR_ROOT}/examples/resources/ios/images")
sugar_mark_macosx_resources(${DEFAULT_IOS_IMAGES})

### create ios target
add_executable(example MACOSX_BUNDLE test.cpp ${DEFAULT_IOS_IMAGES})
target_link_libraries(example ${Boost_LIBRARIES})
sugar_set_xcode_ios_sdkroot(TARGET example PLIST "${PLIST_FILE}")

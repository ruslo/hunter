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

# emulate ${HUNTER_SELF}/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download boost
hunter_add_package(Sugar) # get resources and plist from examples
hunter_add_package(Boost COMPONENTS filesystem system test regex)

# use sugar
include(${SUGAR_ROOT}/cmake/Sugar)
include(sugar_include)

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
set(MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.hunter.ios.EmptyApplication")

# DEFAULT_IOS_IMAGES
sugar_include("${SUGAR_ROOT}/examples/resources/ios/images")

### create ios target
add_executable(example test.cpp ${DEFAULT_IOS_IMAGES})
target_link_libraries(example ${Boost_LIBRARIES})

set_target_properties(
    example
    PROPERTIES
    MACOSX_BUNDLE YES
    MACOSX_BUNDLE_INFO_PLIST "${SUGAR_ROOT}/examples/plist/ios/empty.plist.in"
    MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.sugar.ios.SingleViewApplication"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2" # Universal (iPad + iPhone)
    XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
    RESOURCE "${DEFAULT_IOS_IMAGES}"
)

target_link_libraries(
    example
    "-framework CoreGraphics"
    "-framework Foundation"
    "-framework UIKit"
)

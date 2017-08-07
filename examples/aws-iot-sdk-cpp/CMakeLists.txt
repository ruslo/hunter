cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aws-iot-sdk-cpp)

hunter_add_package(aws-iot-sdk-cpp)
find_library(
    aws-iot-sdk-cpp_release
    aws-iot-sdk-cpp
    PATHS ${AWS-IOT-SDK-CPP_ROOT}/lib
)

if (NOT aws-iot-sdk-cpp_release)
    message(FATAL_ERROR "aws-iot-sdk-cpp Release libraries not found.")
endif(NOT aws-iot-sdk-cpp_release)

find_library(
    aws-iot-sdk-cpp_debug
    aws-iot-sdk-cpp${CMAKE_DEBUG_POSTFIX}
    PATHS ${AWS-IOT-SDK-CPP_ROOT}/lib
)

if (NOT aws-iot-sdk-cpp_debug)
    message(FATAL_ERROR "aws-iot-sdk-cpp Debug libraries not found.")
endif(NOT aws-iot-sdk-cpp_debug)

set(aws-iot-sdk-cpp_LIBRARIES debug ${aws-iot-sdk-cpp_debug}
                    optimized ${aws-iot-sdk-cpp_release})
message(STATUS ${aws-iot-sdk-cpp_LIBRARIES})

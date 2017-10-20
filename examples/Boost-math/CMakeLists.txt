# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS math)

# now boost can be used
# you need to choose which form of Boost::math you want
#find_package(Boost CONFIG REQUIRED math_c99)
#find_package(Boost CONFIG REQUIRED math_c99f)
#find_package(Boost CONFIG REQUIRED math_c99l)
find_package(Boost CONFIG REQUIRED math_tr1)
#find_package(Boost CONFIG REQUIRED math_tr1f)
#find_package(Boost CONFIG REQUIRED math_tr1l)
add_executable(foo foo.cpp)
target_link_libraries(foo Boost::math_tr1)

# Compatibility mode
set(Boost_USE_STATIC_LIBS ON)
if(MSVC)
  add_definitions(-DBOOST_ALL_NO_LIB=1)
endif()
# you need to choose which form of Boost::math you want
#find_package(Boost CONFIG REQUIRED math_c99)
#find_package(Boost CONFIG REQUIRED math_c99f)
#find_package(Boost CONFIG REQUIRED math_c99l)
find_package(Boost CONFIG REQUIRED math_tr1)
#find_package(Boost CONFIG REQUIRED math_tr1f)
#find_package(Boost CONFIG REQUIRED math_tr1l)
include_directories(${Boost_INCLUDE_DIRS})
target_link_libraries(foo ${Boost_LIBRARIES})


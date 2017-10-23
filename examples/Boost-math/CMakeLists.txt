# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS math)

# now boost::math_* targets
# link in all the parts of boost math, or leave out unneeded parts
find_package(Boost CONFIG REQUIRED math_c99 math_c99f math_c99l math_tr1 math_tr1f math_tr1l)
add_executable(foo foo.cpp)
# link in the libraries as well for whatever is found above in find_package
target_link_libraries(foo
  Boost::math_c99
  Boost::math_c99f
  Boost::math_c99l
  Boost::math_tr1
  Boost::math_tr1f
  Boost::math_tr1l
)


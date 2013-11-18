# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# emulate polly/Libstdcxx (https://github.com/ruslo/polly)

if(DEFINED EXAMPLE_TOOLCHAIN_CMAKE)
  return()
else()
  set(EXAMPLE_TOOLCHAIN_CMAKE 1)
endif()

set(
    CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libstdc++"
    CACHE
    STRING
    "C++ compiler flags"
)

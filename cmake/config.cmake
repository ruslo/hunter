# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_CONFIG_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_CONFIG_CMAKE_ 1)
endif()

include(hunter_config)

# unset <NAME>_ROOT (cache, environment, ...)
# set HUNTER_<name>_VERSION or <NAME>_ROOT

# NOTE: no names with spaces!

hunter_config(Boost VERSION 1.54.0)
hunter_config(GTest VERSION 1.7.0-sugar)
hunter_config(Sugar VERSION 1.0.0)

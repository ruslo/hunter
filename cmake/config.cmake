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

hunter_config(Boost VERSION 1.55.0)
hunter_config(CppNetlib VERSION 0.10.1-hunter-2)
hunter_config(GTest VERSION 1.7.0-hunter-3)
hunter_config(OpenSSL VERSION 1.0.1f)
hunter_config(RapidJSON VERSION 0.11-hunter)
hunter_config(Sugar VERSION 1.0.10)
hunter_config(ios_sim VERSION 1.8.2)

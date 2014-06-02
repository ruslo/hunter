# Copyright (c) 2013-2014, Ruslan Baratov
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

hunter_config(Boost VERSION 1.55.0-patched)
hunter_config(CppNetlib VERSION 0.10.1-hunter-3)
hunter_config(CppNetlibUri VERSION 1.0.0-hunter)
hunter_config(GTest VERSION 1.7.0-hunter-7)
hunter_config(Igloo VERSION 1.1.1-hunter)
hunter_config(IntSizeof VERSION 1.0.0)
hunter_config(JsonSpirit VERSION 0.0.1-hunter)
hunter_config(Leathers VERSION 0.1.0)
hunter_config(OpenSSL VERSION 1.0.1f)
hunter_config(RapidJSON VERSION 0.11-hunter)
hunter_config(Sober VERSION 0.0.1)
hunter_config(Sugar VERSION 1.1.0)
hunter_config(ZLIB VERSION 1.2.8-hunter CMAKE_ARGS ZLIB_BUILD_SHARED=OFF)
hunter_config(ios_sim VERSION 1.8.2)

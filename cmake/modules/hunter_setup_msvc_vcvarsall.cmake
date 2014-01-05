# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

macro(hunter_setup_msvc_vcvarsall)
  if(MSVC AND NOT HUNTER_MSVC_VCVARSALL)
    set(_hunter_result "${CMAKE_GENERATOR}")

    string(REPLACE " Win64" "" _hunter_result "${_hunter_result}")
    string(REPLACE " ARM" "" _hunter_result "${_hunter_result}")
    string(REPLACE "Visual Studio " "" _hunter_result "${_hunter_result}")
    set(_hunter_result "${_hunter_result}0")
    set(_hunter_result "VS${_hunter_result}COMNTOOLS")

    set(_hunter_result "$ENV{${_hunter_result}}/../../VC")
    get_filename_component(_hunter_result "${_hunter_result}" ABSOLUTE)
    find_file(
        HUNTER_MSVC_VCVARSALL
        "vcvarsall.bat"
        PATHS
        "${_hunter_result}"
        NO_DEFAULT_PATH
    )
    if(NOT HUNTER_MSVC_VCVARSALL)
      hunter_fatal_error("vcvarsall.bat not found in `${_hunter_result}`")
    endif()
  endif()
endmacro()

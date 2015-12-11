# Copyright (c) 2014,2015, Ruslan Baratov, Sumedh Ghaisas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_status_debug)

# Detect architecture, year and version by MSVC name generator.
# Sets HUNTER_MSVC_ARCH, HUNTER_MSVC_VERSION, HUNTER_MSVC_YEAR
# Variable used to start VS Command Prompt.
# See section "Vcvarsall.bat argument":
#     * http://msdn.microsoft.com/en-us/library/x4d2c09s.aspx
# Checks for file "vcvarsall.bat" and imports the file as HUNTER_MSVC_VCVARSALL
macro(hunter_setup_msvc)
  if(MSVC AND NOT HUNTER_MSVC_ARCH)
    hunter_status_debug("MSVC generator: ${CMAKE_GENERATOR}")
    STRING(REGEX REPLACE "^Visual Studio (8 2005|9 2008|10 2010|11 2012|12 2013|14 2015)( Win64| ARM|)" "\\1;\\2" _hunter_msvc_check "${CMAKE_GENERATOR}")
    list(GET _hunter_msvc_check 0 _hunter_msvc_check_string)

    string(COMPARE EQUAL "${_hunter_msvc_check_string}" "${CMAKE_GENERATOR}" _hunter_msvc_check_string_bool)

    if(_hunter_msvc_check_string_bool)
      hunter_internal_error("Invalid MSVC generator: ${CMAKE_GENERATOR}")
    else()
      STRING(REPLACE " " ";" _hunter_msvc_version_list "${_hunter_msvc_check_string}")
      list(GET _hunter_msvc_version_list 0 HUNTER_MSVC_VERSION)
      list(GET _hunter_msvc_version_list 1 HUNTER_MSVC_YEAR)

      hunter_status_debug("HUNTER_MSVC_VERSION: ${HUNTER_MSVC_VERSION}")
      hunter_status_debug("HUNTER_MSVC_YEAR: ${HUNTER_MSVC_YEAR}")

      list(GET _hunter_msvc_check 1 HUNTER_MSVC_ARCH)
      string(STRIP "${HUNTER_MSVC_ARCH}" HUNTER_MSVC_ARCH)

      string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "Win64" _hunter_result_win64)
      string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "ARM" _hunter_result_arm)
      string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "" _hunter_result_x86)

      if(_hunter_result_win64)
        set(HUNTER_MSVC_ARCH "amd64")
      elseif(_hunter_result_arm)
        set(HUNTER_MSVC_ARCH "x86_arm")
      elseif(_hunter_result_x86)
        set(HUNTER_MSVC_ARCH "x86")
      else()
        hunter_internal_error("Can't detect generator arch: ${CMAKE_GENERATOR}")
      endif()

      hunter_status_debug("HUNTER_MSVC_ARCH: ${HUNTER_MSVC_ARCH}")

      set(_hunter_vcvarsall_env "${HUNTER_MSVC_VERSION}0")
      set(_hunter_vcvarsall_env "VS${_hunter_vcvarsall_env}COMNTOOLS")
      set(_hunter_vcvarsall_path "$ENV{${_hunter_vcvarsall_env}}")

      string(COMPARE EQUAL "${_hunter_vcvarsall_path}" "" _is_empty)
      if(_is_empty)
        if(HUNTER_TESTING)
          # ignore error, see 'tests/hunter_setup_msvc/CMakeLists.txt'
        else()
          hunter_internal_error(
               "Environment variable ${_hunter_vcvarsall_env} is empty"
          )
        endif()
      endif()

      set(_hunter_vcvarsall_path "${_hunter_vcvarsall_path}/../../VC")
      get_filename_component(_hunter_vcvarsall_path "${_hunter_vcvarsall_path}" ABSOLUTE)
      find_file(
        HUNTER_MSVC_VCVARSALL
        "vcvarsall.bat"
        PATHS
        "${_hunter_vcvarsall_path}"
        NO_DEFAULT_PATH
      )
      if(NOT HUNTER_MSVC_VCVARSALL)
        if(HUNTER_TESTING)
          # ignore error, see 'tests/hunter_setup_msvc/CMakeLists.txt'
        else()
          hunter_internal_error("vcvarsall.bat not found in `${_hunter_vcvarsall_path}`")
        endif()
      endif()

      hunter_status_debug("vcvarsall.bat file location: ${HUNTER_MSVC_VCVARSALL}")

      unset(_hunter_result_win64)
      unset(_hunter_result_arm)
      unset(_hunter_result_x86)
      unset(_hunter_msvc_check)
      unset(_hunter_msvc_check_string)
      unset(_hunter_msvc_check_string_bool)
      unset(_hunter_msvc_version_list)
      unset(_hunter_vcvarsall_path)
    endif()
  endif()
endmacro()

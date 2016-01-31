# Copyright (c) 2014-2016, Ruslan Baratov, Sumedh Ghaisas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_status_debug)

# Set next variables to the current scope:
# * HUNTER_MSVC_VERSION - version of Visual Studio. Used to create VS*COMNTOOLS
#     environment variable name, e.g.:
#     Visual Studio 8 2005 -> VS80COMNTOOLS
#     Visual Studio 14 2015 -> VS140COMNTOOLS
# * HUNTER_MSVC_YEAR - year of Visual Studio. Used by 'url_sha1_qt' scheme
# * HUNTER_MSVC_ARCH - architecture specifier. Variable used to start VS
#     Command Prompt. See section "Vcvarsall.bat argument":
#     - http://msdn.microsoft.com/en-us/library/x4d2c09s.aspx
#     - http://msdn.microsoft.com/library/x4d2c09s%28v=vs.110%29.aspx
#     CMake generator -> HUNTER_MSVC_ARCH example:
#       Visual Studio 12 2013 -> x86
#       Visual Studio 12 2013 Win64 -> amd64
#       Visual Studio 12 2013 ARM -> x86_arm
#     CMake's MSVC_CXX_ARCHITECTURE_ID:
#       X86 -> x86
#       x64 -> amd64
#       ARMV7 -> x86_arm
# * HUNTER_MSVC_VCVARSALL - full path to the 'vcvarsall.bat' script

# This function should work with all generators that provide MSVC compiler:
# * Visual Studio ...
# * NMake Makefiles
# * Ninja

# User can set all HUNTER_MSVC_* variables manually in toolchain to force
# custom values (checked by HUNTER_MSVC_ARCH)
macro(hunter_setup_msvc)
  if(MSVC AND NOT HUNTER_MSVC_ARCH)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1400" _vs_8_2005)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1500" _vs_9_2008)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1600" _vs_10_2010)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1700" _vs_11_2012)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1800" _vs_12_2013)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1900" _vs_14_2015)

    if(_vs_8_2005)
      set(HUNTER_MSVC_VERSION "8")
      set(HUNTER_MSVC_YEAR "2005")
    elseif(_vs_9_2008)
      set(HUNTER_MSVC_VERSION "9")
      set(HUNTER_MSVC_YEAR "2008")
    elseif(_vs_10_2010)
      set(HUNTER_MSVC_VERSION "10")
      set(HUNTER_MSVC_YEAR "2010")
    elseif(_vs_11_2012)
      set(HUNTER_MSVC_VERSION "11")
      set(HUNTER_MSVC_YEAR "2012")
    elseif(_vs_12_2013)
      set(HUNTER_MSVC_VERSION "12")
      set(HUNTER_MSVC_YEAR "2013")
    elseif(_vs_14_2015)
      set(HUNTER_MSVC_VERSION "14")
      set(HUNTER_MSVC_YEAR "2015")
    else()
      hunter_internal_error("Unexpected MSVC_VERSION: '${MSVC_VERSION}'")
    endif()

    hunter_status_debug("HUNTER_MSVC_VERSION: ${HUNTER_MSVC_VERSION}")
    hunter_status_debug("HUNTER_MSVC_YEAR: ${HUNTER_MSVC_YEAR}")

    string(COMPARE EQUAL "${MSVC_CXX_ARCHITECTURE_ID}" "" _cxx_is_empty)
    string(COMPARE EQUAL "${MSVC_C_ARCHITECTURE_ID}" "" _c_is_empty)

    if(NOT _cxx_is_empty)
      set(_architecture_id "${MSVC_CXX_ARCHITECTURE_ID}")
    elseif(NOT _c_is_empty)
      set(_architecture_id "${MSVC_C_ARCHITECTURE_ID}")
    else()
      hunter_internal_error("MSVC_*_ARCHITECTURE_ID is empty")
    endif()

    string(COMPARE EQUAL "${_architecture_id}" "X86" _is_x86)
    string(COMPARE EQUAL "${_architecture_id}" "x64" _is_x64)
    string(COMPARE EQUAL "${_architecture_id}" "ARMV7" _is_arm)

    if(_is_x86)
      set(HUNTER_MSVC_ARCH "x86")
    elseif(_is_x64)
      set(HUNTER_MSVC_ARCH "amd64")
    elseif(_is_arm)
      set(HUNTER_MSVC_ARCH "x86_arm")
    else()
      hunter_internal_error(
          "Unexpected MSVC_*_ARCHITECTURE_ID: '${_architecture_id}'"
      )
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
    get_filename_component(
        _hunter_vcvarsall_path "${_hunter_vcvarsall_path}" ABSOLUTE
    )
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
        hunter_internal_error(
            "vcvarsall.bat not found in `${_hunter_vcvarsall_path}`"
        )
      endif()
    endif()

    hunter_status_debug("vcvarsall.bat file location: ${HUNTER_MSVC_VCVARSALL}")
  endif()
endmacro()

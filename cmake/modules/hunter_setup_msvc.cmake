# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)

macro(hunter_setup_msvc_arch)
  if(MSVC AND NOT HUNTER_MSVC_ARCH)
    # Detect architecture by MSVC name generator.
    # Variable used to start VS Command Prompt.
    # See section "Vcvarsall.bat argument":
    #     * http://msdn.microsoft.com/en-us/library/x4d2c09s.aspx
    set(HUNTER_MSVC_ARCH "${CMAKE_GENERATOR}")

    # "Visual Studio 8 2005???" => "8 2005???"
    # "Visual Studio 9 2008???" => "9 2008???"
    # "Visual Studio 10 2010???" => "10 2010???"
    # "Visual Studio 11 2012???" => "11 2012???"
    # "Visual Studio 12 2013???" => "12 2013???"
    string(
        REGEX
        REPLACE
        "^Visual Studio "
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )

    # => " 2005???"
    # => " 2008???"
    # => "0 2010???"
    # => "1 2012???"
    # => "2 2013???"
    string(
        REGEX
        REPLACE
        "^[1-9]"
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )

    # => " 2005???"
    # => " 2008???"
    # => " 2010???"
    # => " 2012???"
    # => " 2013???"
    string(
        REGEX
        REPLACE
        "^[0-9]"
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )

    # => "???"
    # => "???"
    # => "???"
    # => "???"
    # => "???"
    string(
        REGEX
        REPLACE
        "^ 20[0-9][0-9]"
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )

    # "???" = " Win64" | " ARM" | ""
    # => "???"
    # => "???"
    # => "???"
    # => "???"
    # => "???"
    string(
        REGEX
        REPLACE
        "^ "
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )

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

    unset(_hunter_result_win64)
    unset(_hunter_result_arm)
    unset(_hunter_result_x86)
  endif()
endmacro()

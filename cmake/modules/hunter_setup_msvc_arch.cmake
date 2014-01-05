# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

macro(hunter_setup_msvc_arch)
  if(MSVC AND NOT HUNTER_MSVC_ARCH)
    # Detect architecture by MSVC name generator.
    # Variable used to start VS Command Prompt.
    # See section "Vcvarsall.bat argument":
    #     * http://msdn.microsoft.com/en-us/library/x4d2c09s.aspx
    set(HUNTER_MSVC_ARCH "${CMAKE_GENERATOR}")
    string(
        REGEX
        REPLACE
        "^Visual Studio [1-9][0-9]$"
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )
    string(
        REGEX
        REPLACE
        "^Visual Studio [1-9]$"
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )
    string(
        REGEX
        REPLACE
        "^Visual Studio [1-9][0-9] "
        ""
        HUNTER_MSVC_ARCH
        "${HUNTER_MSVC_ARCH}"
    )
    string(
        REGEX
        REPLACE
        "^Visual Studio [1-9] "
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
      hunter_fatal_error("Can't detect generator arch: ${CMAKE_GENERATOR}")
    endif()

    unset(_hunter_result_win64)
    unset(_hunter_result_arm)
    unset(_hunter_result_x86)
  endif()
endmacro()

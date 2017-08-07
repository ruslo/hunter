# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_get_lang_standard_flag)
include(hunter_test_string_not_empty)

# Packages to test this function:
# * Boost
# * OpenSSL
# * odb-boost
function(hunter_dump_cmake_flags)
  cmake_parse_arguments(x "SKIP_INCLUDES" "CPPFLAGS" "" "${ARGV}")
  # -> x_SKIP_INCLUDES
  # -> x_CPPFLAGS

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()


  if(IOS)
    hunter_test_string_not_empty("${IOS_SDK_VERSION}")
    string(COMPARE EQUAL "${IOS_DEPLOYMENT_SDK_VERSION}" "" _no_deployment_sdk_version)
    if(_no_deployment_sdk_version)
      set(CMAKE_CXX_FLAGS "-miphoneos-version-min=${IOS_SDK_VERSION}")
      set(CMAKE_C_FLAGS "-miphoneos-version-min=${IOS_SDK_VERSION}")
    else()
      set(CMAKE_CXX_FLAGS "-miphoneos-version-min=${IOS_DEPLOYMENT_SDK_VERSION}")
      set(CMAKE_C_FLAGS "-miphoneos-version-min=${IOS_DEPLOYMENT_SDK_VERSION}")
    endif()
  
    if(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fembed-bitcode")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fembed-bitcode")
    endif()  
  endif()

  set(cppflags "")

  if(ANDROID)
    # --sysroot=/path/to/sysroot not added by CMake 3.7+
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --sysroot=${CMAKE_SYSROOT}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${CMAKE_SYSROOT}")
    set(cppflags "${cppflags} --sysroot=${CMAKE_SYSROOT}")

    if(NOT x_SKIP_INCLUDES)
      foreach(x ${CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES})
        set(
            CMAKE_CXX_FLAGS
            "${CMAKE_CXX_FLAGS} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${x}"
        )
        set(
            CMAKE_C_FLAGS
            "${CMAKE_C_FLAGS} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${x}"
        )
        set(
            cppflags
            "${cppflags} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${x}"
        )
      endforeach()
    endif()

    foreach(x ${CMAKE_CXX_IMPLICIT_LINK_LIBRARIES})
      if(EXISTS "${x}")
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${x}")
      else()
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -l${x}")
      endif()
    endforeach()
  endif()

  hunter_get_lang_standard_flag(CXX flag)
  string(COMPARE NOTEQUAL "${flag}" "" has_flag)
  if(has_flag)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
  endif()

  hunter_get_lang_standard_flag(C flag)
  string(COMPARE NOTEQUAL "${flag}" "" has_flag)
  if(has_flag)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${flag}")
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILER_TARGET}" "" has_value)
  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILE_OPTIONS_TARGET}" "" has_option)
  if(has_value AND has_option)
    set(
        CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_COMPILE_OPTIONS_TARGET}${CMAKE_CXX_COMPILER_TARGET}"
    )
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILER_TARGET}" "" has_value)
  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILE_OPTIONS_TARGET}" "" has_option)
  if(has_value AND has_option)
    set(
        CMAKE_C_FLAGS
        "${CMAKE_C_FLAGS} ${CMAKE_C_COMPILE_OPTIONS_TARGET}${CMAKE_C_COMPILER_TARGET}"
    )
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN}" "" has_value)
  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILE_OPTIONS_EXTERNAL_TOOLCHAIN}" "" has_option)
  if(has_value AND has_option)
    set(
        CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_COMPILE_OPTIONS_EXTERNAL_TOOLCHAIN}${CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN}"
    )
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}" "" has_value)
  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILE_OPTIONS_EXTERNAL_TOOLCHAIN}" "" has_option)
  if(has_value AND has_option)
    set(
        CMAKE_C_FLAGS
        "${CMAKE_C_FLAGS} ${CMAKE_C_COMPILE_OPTIONS_EXTERNAL_TOOLCHAIN}${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}"
    )
  endif()

  # PIC {
  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILE_OPTIONS_PIC}" "" has_pic)
  if(CMAKE_POSITION_INDEPENDENT_CODE AND has_pic)
    set(
        CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_COMPILE_OPTIONS_PIC}"
    )
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILE_OPTIONS_PIC}" "" has_pic)
  if(CMAKE_POSITION_INDEPENDENT_CODE AND has_pic)
    set(
        CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_COMPILE_OPTIONS_PIC}"
    )
  endif()
  # }

  # IPO {
  string(COMPARE NOTEQUAL "${CMAKE_CXX_COMPILE_OPTIONS_IPO}" "" has_ipo)
  if(CMAKE_INTERPROCEDURAL_OPTIMIZATION AND has_ipo)
    foreach(x ${CMAKE_CXX_COMPILE_OPTIONS_IPO})
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${x}")
    endforeach()
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_C_COMPILE_OPTIONS_IPO}" "" has_ipo)
  if(CMAKE_INTERPROCEDURAL_OPTIMIZATION AND has_ipo)
    foreach(x ${CMAKE_C_COMPILE_OPTIONS_IPO})
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${x}")
    endforeach()
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_CXX_LINK_OPTIONS_IPO}" "" has_ipo)
  if(CMAKE_INTERPROCEDURAL_OPTIMIZATION AND has_ipo)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${CMAKE_CXX_LINK_OPTIONS_IPO}")
  endif()
  # }

  string(COMPARE EQUAL "${x_CPPFLAGS}" "" is_empty)
  if(NOT is_empty)
    set("${x_CPPFLAGS}" "${${x_CPPFLAGS}} ${cppflags}" PARENT_SCOPE)
  endif()

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" PARENT_SCOPE)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" PARENT_SCOPE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" PARENT_SCOPE)
endfunction()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:

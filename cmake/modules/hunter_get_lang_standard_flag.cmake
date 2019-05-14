# Copyright (c) 2017 Pawel Bylica
# All rights reserved.

include(hunter_status_debug)

function(hunter_get_lang_standard_flag LANG OUTPUT)
  # https://github.com/Kitware/CMake/blob/9d48d3f61b25400a191f12ea92b8e5496ab47a8f/Source/cmLocalGenerator.cxx#L1766-L1782
  set(CXX_standards 20 17 14 11 98)
  set(C_standards 11 99 90)

  # Find the <lang> standard flag.
  # This maps the logic in the CMake code:
  # https://github.com/Kitware/CMake/blob/3bccdd89c88864839a0c8d4ea56bd069c90fa02b/Source/cmLocalGenerator.cxx#L1433-L1467

  hunter_status_debug("CMAKE_${LANG}_STANDARD_DEFAULT: ${CMAKE_${LANG}_STANDARD_DEFAULT}")
  hunter_status_debug("CMAKE_${LANG}_STANDARD: ${CMAKE_${LANG}_STANDARD}")
  hunter_status_debug("CMAKE_${LANG}_EXTENSIONS: ${CMAKE_${LANG}_EXTENSIONS}")
  hunter_status_debug("CMAKE_${LANG}_STANDARD_REQUIRED: ${CMAKE_${LANG}_STANDARD_REQUIRED}")

  set("${OUTPUT}" "" PARENT_SCOPE)  # Reset output in case of quick return.

  string(COMPARE EQUAL "${CMAKE_${LANG}_STANDARD_DEFAULT}" "" no_default)
  if(no_default)
    # This compiler has no notion of language standard levels.
    # https://github.com/Kitware/CMake/blob/3bccdd89c88864839a0c8d4ea56bd069c90fa02b/Source/cmLocalGenerator.cxx#L1427-L1432
    return()
  endif()

  set(standard "${CMAKE_${LANG}_STANDARD}")
  string(COMPARE EQUAL "${standard}" "" no_standard)
  if(no_standard)
    # The standard not defined by user.
    # https://github.com/Kitware/CMake/blob/3bccdd89c88864839a0c8d4ea56bd069c90fa02b/Source/cmLocalGenerator.cxx#L1433-L1437
    return()
  endif()

  # Decide on version with extensions or a clean one.
  # By default extensions are assumed On.
  # https://github.com/Kitware/CMake/blob/3bccdd89c88864839a0c8d4ea56bd069c90fa02b/Source/cmLocalGenerator.cxx#L1438-L1446
  set(ext "EXTENSION")
  if(DEFINED CMAKE_${LANG}_EXTENSIONS AND NOT CMAKE_${LANG}_EXTENSIONS)
    set(ext "STANDARD")
  endif()

  set(standards "${${LANG}_standards}")
  list(FIND standards "${standard}" begin)
  if("${begin}" EQUAL "-1")
    hunter_internal_error("${LANG} standard ${standard} not known")
    return()
  endif()

  set(flag "")
  list(LENGTH standards end)
  math(EXPR end "${end} - 1")
  foreach(idx RANGE ${begin} ${end})
    list(GET standards ${idx} standard)
    set(option_name "CMAKE_${LANG}${standard}_${ext}_COMPILE_OPTION")
    set(flag "${${option_name}}")
    hunter_status_debug("${option_name}: '${flag}'")
    string(COMPARE NOTEQUAL "${flag}" "" has_flag)
    if(has_flag OR CMAKE_${LANG}_STANDARD_REQUIRED)
      # Break if flag found or standard is required and we don't want to
      # continue checking older standards.
      break()
    endif()
  endforeach()
  hunter_status_debug("hunter_get_lang_standard_flag(${LANG}): '${flag}'")
  set("${OUTPUT}" "${flag}" PARENT_SCOPE)
endfunction()

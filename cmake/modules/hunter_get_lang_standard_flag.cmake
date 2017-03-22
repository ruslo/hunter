# Copyright (c) 2017 Pawel Bylica
# All rights reserved.

include(hunter_status_debug)

function(hunter_get_lang_standard_flag LANG OUTPUT)
  set(CXX_standards 17 14 11 98)
  set(C_standards 11 99 90)
  # Find the <lang> standard flag.
  # This maps the logic in the CMake code:
  # https://github.com/Kitware/CMake/blob/3bccdd89c88864839a0c8d4ea56bd069c90fa02b/Source/cmLocalGenerator.cxx#L1433-L1467
  set(flag "")
  set(std "${CMAKE_${LANG}_STANDARD}")
  if(std)
    set(ext "EXTENSION")  # By default extensions are assumed On.
    if(DEFINED CMAKE_${LANG}_EXTENSIONS AND NOT CMAKE_${LANG}_EXTENSIONS)
      set(ext "STANDARD")
    endif()

    set(standards "${${LANG}_standards}")
    list(FIND standards "${std}" begin)
    if(NOT "${begin}" EQUAL -1)
      list(LENGTH standards end)
      math(EXPR end "${end} - 1")
      foreach(idx RANGE ${begin} ${end})
        list(GET standards ${idx} std)
        set(option_name "CMAKE_${LANG}${std}_${ext}_COMPILE_OPTION")
        set(flag "${${option_name}}")
        string(COMPARE NOTEQUAL "${flag}" "" has_flag)
        if(has_flag OR CMAKE_${LANG}_STANDARD_REQUIRED)
          # Break if flag found or standard is required and we don't want to
          # continue checking older standards.
          break()
        endif()
      endforeach()
    endif()
  endif()
  hunter_status_debug("${LANG} std flag: '${flag}'")
  set(${OUTPUT} "${flag}" PARENT_SCOPE)
endfunction()

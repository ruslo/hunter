# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)
include(hunter_fatal_error)

# Usually temporary build directory created inside
# `${PROJECT_BINARY_DIR}/_3rdParty/hunter/<action>` but for microsoft it
# may lead to error 'path too long'. So if we on windows and HUNTER_JUNCTIONS
# environment variable detected create unique directory, make a junction and
# return (expected short) path to junction point.
# Note: 'GetShortPathName' and extended path (\\?\) not working
# even for native Visual Studio projects (facepalm...)
function(hunter_get_temp_directory hint_directory result)
  if(NOT WIN32)
    set(${result} "${hint_directory}" PARENT_SCOPE)
    return()
  endif()

  string(COMPARE EQUAL "$ENV{HUNTER_JUNCTIONS}" "" no_junctions)
  if(no_junctions)
    set(${result} "${hint_directory}" PARENT_SCOPE)
    return()
  endif()

  set(junctions_root "$ENV{HUNTER_JUNCTIONS}")
  get_filename_component(junctions_root "${junctions_root}" ABSOLUTE)
  hunter_status_debug("HUNTER_JUNCTIONS: ${junctions_root}")

  string(RANDOM LENGTH 10 rand)
  set(temp_directory "${junctions_root}/${rand}")
  if(EXISTS "${temp_directory}")
    hunter_fatal_error(
        "Lucky you! Get your number: ${rand} (:"
        WIKI "https://github.com/ruslo/hunter/wiki/Error-%28Lucky%29"
    )
  endif()

  execute_process(
      COMMAND "${CMAKE_COMMAND}" -E make_directory "${junctions_root}"
      RESULT_VARIABLE create_result
  )

  if(NOT create_result EQUAL 0)
    hunter_fatal_error(
        "Directory creation failed (${junctions_root})"
        WIKI "https://github.com/ruslo/hunter/wiki/Error-%28directory-creation-failed%29"
    )
  endif()

  hunter_status_debug("Create windows junction:")
  hunter_status_debug("  from: ${hint_directory}")
  hunter_status_debug("  to: ${temp_directory}")

  string(REPLACE "/" "\\" hint_windows "${hint_directory}")
  string(REPLACE "/" "\\" temp_windows "${temp_directory}")

  file(MAKE_DIRECTORY "${hint_directory}")

  execute_process(
      COMMAND cmd "/c" mklink "/J" "${temp_windows}" "${hint_windows}"
      RESULT_VARIABLE junctions_result
  )

  if(NOT junctions_result EQUAL 0)
    hunter_fatal_error(
        "Junction point creation failed"
        WIKI "https://github.com/ruslo/hunter/wiki/Error-%28Junction-point-creation-failed%29"
    )
  endif()

  set(${result} "${temp_directory}" PARENT_SCOPE)
endfunction()

# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_test_string_not_empty)

function(hunter_create_cache_file cache_path)
  hunter_test_string_not_empty("${cache_path}")

  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_SHA1}")
  hunter_test_string_not_empty("${HUNTER_CONFIG_SHA1}")
  hunter_test_string_not_empty("${HUNTER_VERSION}")
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_SHA1}")
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_ID_PATH}")

  if(EXISTS "${cache_path}")
    return()
  endif()

  hunter_lock_directory("${HUNTER_TOOLCHAIN_ID_PATH}")

  # While waiting for lock other instance can create this file
  if(EXISTS "${cache_path}")
    return()
  endif()

  set(temp_path "${cache_path}.temp")

  file(REMOVE "${temp_path}")

  # Tell other packages that they need to use our settings instead of
  # parsing their HunterGate parameters
  # (note: HUNTER_GATE_DONE may not be set for now)
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_GATE_DONE ON CACHE INTERNAL \"\")\n"
  )

  # Enable Hunter package manager for projects where it is disabled by default
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_ENABLED ON CACHE INTERNAL \"\")\n"
  )

  # Let all project have same debug status
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_STATUS_DEBUG \"${HUNTER_STATUS_DEBUG}\" CACHE INTERNAL \"\")\n"
  )

  # Let all project build with the same number of jobs
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_JOBS_NUMBER \"${HUNTER_JOBS_NUMBER}\" CACHE INTERNAL \"\")\n"
  )

  # Let all projects have same postfixes
  foreach(configuration ${HUNTER_CACHED_CONFIGURATION_TYPES})
    string(TOUPPER "${configuration}" configuration_upper)
    file(
        APPEND
        "${temp_path}"
        "set(CMAKE_${configuration_upper}_POSTFIX \"${CMAKE_${configuration_upper}_POSTFIX}\" CACHE INTERNAL \"\")\n"
    )
  endforeach()

  # Forward variables that affect/form root directory and toolchain-ID creation
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_CACHED_ROOT \"${HUNTER_CACHED_ROOT}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_SHA1 \"${HUNTER_SHA1}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_CONFIG_SHA1 \"${HUNTER_CONFIG_SHA1}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_VERSION \"${HUNTER_VERSION}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_TOOLCHAIN_SHA1 \"${HUNTER_TOOLCHAIN_SHA1}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${temp_path}"
      "set(HUNTER_CACHED_CONFIGURATION_TYPES \"${HUNTER_CACHED_CONFIGURATION_TYPES}\" CACHE INTERNAL \"\")\n"
  )

  # Atomic operation
  file(RENAME "${temp_path}" "${cache_path}")
endfunction()

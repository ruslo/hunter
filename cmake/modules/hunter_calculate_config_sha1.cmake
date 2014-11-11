# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_calculate_config_sha1)
  hunter_test_string_not_empty("${HUNTER_CONFIG}")
  hunter_test_string_not_empty("${HUNTER_SELF}")
  if(NOT EXISTS "${HUNTER_CONFIG}")
    hunter_internal_error("Hunter config not exists")
  endif()

  hunter_status_debug("Calculating Config-SHA1 of `${HUNTER_CONFIG}`")

  set(script "${HUNTER_SELF}/scripts/calc-config-sha1.cmake")
  if(NOT EXISTS "${script}")
    hunter_internal_error("${script} not exists")
  endif()

  set(work_dir "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/config-id")
  file(MAKE_DIRECTORY "${work_dir}")

  set(default_config "${HUNTER_SELF}/cmake/configs/default.cmake")
  set(user_config "${HUNTER_CONFIG}")
  set(directory_with_projects "${HUNTER_SELF}/cmake/projects")

  execute_process(
      COMMAND
          "${CMAKE_COMMAND}"
          "-DDEFAULT_CONFIG=${default_config}"
          "-DUSER_CONFIG=${user_config}"
          "-DDIRECTORY_WITH_PROJECTS=${directory_with_projects}"
          "-DTEMP_DIRECTORY=${work_dir}"
          "-DHUNTER_SELF=${HUNTER_SELF}"
          -P "${script}"
      WORKING_DIRECTORY "${work_dir}"
      RESULT_VARIABLE result
      OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
    hunter_fatal_error(
         "User config `${user_config}` is not correct."
         WIKI "https://github.com/ruslo/hunter/wiki/Error-%28incorrect-input-data%29"
    )
  endif()

  if(NOT EXISTS "${work_dir}/config.cmake")
    hunter_internal_error("config.cmake not generated")
  endif()

  file(SHA1 "${work_dir}/config.cmake" HUNTER_CONFIG_SHA1)
  set(
      dst
      "${HUNTER_ROOT}/_Base/${HUNTER_SHA1_SHORT}/${HUNTER_CONFIG_SHA1}.cmake"
  )
  execute_process(
      COMMAND "${CMAKE_COMMAND}" -E copy "${work_dir}/config.cmake" "${dst}"
  )
  set(
      HUNTER_CONFIG_SHA1
      "${HUNTER_CONFIG_SHA1}"
      CACHE
      STRING
      "Hunter config-SHA1"
  )
  hunter_status_debug("Config sha1: ${HUNTER_CONFIG_SHA1}")
endfunction()

# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_make_directory)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_calculate_config_sha1 hunter_self hunter_base user_config)
  hunter_test_string_not_empty("${HUNTER_GATE_SHA1}")
  hunter_test_string_not_empty("${hunter_self}")
  hunter_test_string_not_empty("${hunter_base}")
  hunter_test_string_not_empty("${user_config}")

  if(NOT EXISTS "${user_config}")
    hunter_internal_error("Hunter config not exists")
  endif()

  hunter_status_print("Calculating Config-SHA1")

  set(script "${hunter_self}/scripts/calc-config-sha1.cmake")
  if(NOT EXISTS "${script}")
    hunter_internal_error("${script} not exists")
  endif()

  set(work_dir "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/config-id")
  file(REMOVE_RECURSE "${work_dir}")
  file(MAKE_DIRECTORY "${work_dir}")

  set(default_config "${hunter_self}/cmake/configs/default.cmake")
  set(directory_with_projects "${hunter_self}/cmake/projects")

  execute_process(
      COMMAND
          "${CMAKE_COMMAND}"
          "-DDEFAULT_CONFIG=${default_config}"
          "-DUSER_CONFIG=${user_config}"
          "-DDIRECTORY_WITH_PROJECTS=${directory_with_projects}"
          "-DTEMP_DIRECTORY=${work_dir}"
          "-DHUNTER_SELF=${hunter_self}"
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

  file(SHA1 "${work_dir}/config.cmake" HUNTER_GATE_CONFIG_SHA1)
  set(HUNTER_GATE_CONFIG_SHA1 "${HUNTER_GATE_CONFIG_SHA1}" PARENT_SCOPE)
  hunter_make_directory("${hunter_base}" "${HUNTER_GATE_SHA1}" hunter_id_path)
  hunter_make_directory(
      "${hunter_id_path}" "${HUNTER_GATE_CONFIG_SHA1}" hunter_config_id_path
  )

  set(dst "${hunter_config_id_path}/config.cmake")

  if(EXISTS "${dst}")
    return()
  endif()

  hunter_lock_directory("${hunter_config_id_path}")
  if(EXISTS "${dst}")
    return()
  endif()

  configure_file("${work_dir}/config.cmake" "${dst}" COPYONLY)
  hunter_status_debug("Config: ${dst}")
  hunter_status_debug("Config sha1: ${HUNTER_CONFIG_SHA1}")
endfunction()

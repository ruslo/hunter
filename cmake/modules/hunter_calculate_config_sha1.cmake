# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_make_directory)
include(hunter_print_cmd)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_user_error)

function(hunter_calculate_config_sha1 hunter_self hunter_base user_config)
  hunter_test_string_not_empty("${HUNTER_GATE_SHA1}")
  hunter_test_string_not_empty("${hunter_self}")
  hunter_test_string_not_empty("${hunter_base}")
  hunter_test_string_not_empty("${user_config}")
  hunter_test_string_not_empty("${CMAKE_BINARY_DIR}")

  hunter_status_print("Calculating Config-SHA1")

  # Include default_config
  set(default_config "${hunter_self}/cmake/configs/default.cmake")
  if(NOT EXISTS "${default_config}")
    hunter_internal_error("File `${default_config}` not exists")
  endif()
  set(HUNTER_ALLOW_CONFIG_LOADING YES)
  include("${default_config}")
  set(HUNTER_ALLOW_CONFIG_LOADING NO)

  # Include user_config
  if(NOT EXISTS "${user_config}")
    hunter_internal_error("Hunter config not exists")
  endif()
  set(HUNTER_ALLOW_CONFIG_LOADING YES)
  include("${user_config}")
  set(HUNTER_ALLOW_CONFIG_LOADING NO)

  # Create list of the projects
  set(directory_with_projects "${hunter_self}/cmake/projects")
  if(NOT EXISTS "${directory_with_projects}")
    hunter_internal_error("Directory `${directory_with_projects}` not exists")
  endif()
  if(NOT IS_DIRECTORY "${directory_with_projects}")
    hunter_internal_error(
        "Path `${directory_with_projects}` is not a directory"
    )
  endif()

  file(
      GLOB projects
      RELATIVE "${directory_with_projects}"
      "${directory_with_projects}/*"
  )

  if(NOT projects)
    hunter_internal_error("No projects found")
  endif()

  set(real_projects "")
  foreach(x ${projects})
    if(IS_DIRECTORY "${directory_with_projects}/${x}")
      list(APPEND real_projects "${x}")
    endif()
  endforeach()

  if(NOT real_projects)
    hunter_internal_error("No projects found")
  endif()

  set(projects "${real_projects}")
  list(SORT projects)

  # Create unified version
  set(work_dir "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/config-id")
  file(REMOVE_RECURSE "${work_dir}")
  file(MAKE_DIRECTORY "${work_dir}")

  set(input_file "${work_dir}/config.cmake")
  file(WRITE "${input_file}" "include(hunter_config)\n")
  foreach(x ${projects})
    set(version "${HUNTER_${x}_VERSION}")
    if(version)
      file(
          APPEND
          "${input_file}"
          "hunter_config(${x} "
          "VERSION ${version}"
      )
      string(COMPARE NOTEQUAL "${HUNTER_${x}_CMAKE_ARGS}" "" have_args)
      if(have_args)
        file(APPEND "${input_file}" " CMAKE_ARGS")
        foreach(y ${HUNTER_${x}_CMAKE_ARGS})
          file(APPEND "${input_file}" " \"${y}\"")
        endforeach()
      endif()
      string(COMPARE NOTEQUAL "${HUNTER_${x}_CONFIGURATION_TYPES}" "" have_types)
      if(have_types)
        file(APPEND "${input_file}" " CONFIGURATION_TYPES")
        foreach(y ${HUNTER_${x}_CONFIGURATION_TYPES})
          file(APPEND "${input_file}" " ${y}")
        endforeach()
      endif()
      file(APPEND "${input_file}" ")\n")
    endif()
  endforeach()

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

  hunter_lock_directory("${hunter_config_id_path}" "")
  if(EXISTS "${dst}")
    return()
  endif()

  configure_file("${work_dir}/config.cmake" "${dst}" COPYONLY)
  hunter_status_debug("Config: ${dst}")
  hunter_status_debug("Config sha1: ${HUNTER_GATE_CONFIG_SHA1}")
endfunction()

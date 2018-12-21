# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_assert_not_empty_string)
include(hunter_config)
include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_make_directory)
include(hunter_print_cmd)
include(hunter_status_debug)
include(hunter_user_error)

function(hunter_calculate_config_sha1 hunter_self hunter_base user_config)
  hunter_assert_not_empty_string("${HUNTER_GATE_SHA1}")
  hunter_assert_not_empty_string("${hunter_self}")
  hunter_assert_not_empty_string("${hunter_base}")
  hunter_assert_not_empty_string("${user_config}")
  hunter_assert_not_empty_string("${CMAKE_BINARY_DIR}")

  hunter_status_print("Calculating Config-SHA1")

  # Include default_config
  set(default_config "${hunter_self}/cmake/configs/default.cmake")
  if(NOT EXISTS "${default_config}")
    hunter_internal_error("File `${default_config}` not exists")
  endif()

  set(__HUNTER_ALLOW_DEFAULT_VERSION_LOADING YES)
  include("${default_config}")
  set(__HUNTER_ALLOW_DEFAULT_VERSION_LOADING NO)

  if(NOT user_config STREQUAL default_config)
    # Include user_config
    if(NOT EXISTS "${user_config}")
      hunter_internal_error("Hunter config not exists")
    endif()
    set(__HUNTER_ALLOW_CONFIG_LOADING YES)
    include("${user_config}") # Use 'hunter_config'
    set(__HUNTER_ALLOW_CONFIG_LOADING NO)
  endif()

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
  list(APPEND projects ${__HUNTER_USER_PACKAGES})
  list(REMOVE_DUPLICATES projects)
  list(SORT projects)

  # Create unified version
  set(work_dir "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/config-id")
  file(REMOVE_RECURSE "${work_dir}")
  file(MAKE_DIRECTORY "${work_dir}")

  set(config_cmake_nolf "${work_dir}/config.cmake.NOLF")
  set(config_cmake_local "${work_dir}/config.cmake")

  file(WRITE "${config_cmake_nolf}" "include(hunter_final_config)\n")
  foreach(x ${projects})
    set(version "${HUNTER_${x}_VERSION}")
    if("${version}" STREQUAL "")
      # Not a real project or not a project directory
      continue()
    endif()

    file(
        APPEND
        "${config_cmake_nolf}"
        "hunter_final_config(\n"
        "    PACKAGE \"${x}\"\n"
        "    VERSION \"${version}\"\n"
    )

    set(sha1 "${__HUNTER_USER_SHA1_${x}}")
    set(cmake_args "${__HUNTER_USER_CMAKE_ARGS_${x}}")
    set(configuration_types "${__HUNTER_USER_CONFIGURATION_TYPES_${x}}")
    set(url "${__HUNTER_USER_URL_${x}}")
    set(keep_package_sources "${__HUNTER_USER_KEEP_PACKAGE_SOURCES_${x}}")

    if(NOT sha1 STREQUAL "")
      file(APPEND "${config_cmake_nolf}" "    SHA1 \"${sha1}\"\n")
    endif()

    if(NOT cmake_args STREQUAL "")
      # " (double quotes) symbol should be escaped,
      # if cmake_args equals to 'FOO=""' then it should be written as 'FOO=\"\"'
      string(REPLACE "\"" "\\\"" cmake_args "${cmake_args}")

      file(APPEND "${config_cmake_nolf}" "    CMAKE_ARGS \"${cmake_args}\"\n")
    endif()

    if(NOT configuration_types STREQUAL "")
      file(
          APPEND
          "${config_cmake_nolf}"
          "    CONFIGURATION_TYPES \"${configuration_types}\"\n"
      )
    endif()

    if(NOT url STREQUAL "")
      file(APPEND "${config_cmake_nolf}" "    URL \"${url}\"\n")
    endif()

    if(NOT keep_package_sources STREQUAL "")
      if(keep_package_sources STREQUAL "TRUE")
        file(APPEND "${config_cmake_nolf}" "    KEEP_PACKAGE_SOURCES\n")
      else()
        hunter_internal_error("Unexpected value: '${keep_package_sources}'")
      endif()
    endif()

    file(APPEND "${config_cmake_nolf}" ")\n")
  endforeach()

  # About '@ONLY': no substitutions expected but COPYONLY can't be
  # used with NEWLINE_STYLE
  configure_file(
      "${config_cmake_nolf}"
      "${config_cmake_local}"
      @ONLY
      NEWLINE_STYLE LF
  )

  file(SHA1 "${config_cmake_local}" HUNTER_GATE_CONFIG_SHA1)

  set(HUNTER_GATE_CONFIG_SHA1 "${HUNTER_GATE_CONFIG_SHA1}" PARENT_SCOPE)
  hunter_make_directory("${hunter_base}" "${HUNTER_GATE_SHA1}" hunter_id_path)

  hunter_make_directory(
      "${hunter_id_path}"
      "${HUNTER_GATE_TOOLCHAIN_SHA1}"
      hunter_toolchain_id_path
  )

  hunter_make_directory(
      "${hunter_toolchain_id_path}"
      "${HUNTER_GATE_CONFIG_SHA1}"
      hunter_config_id_path
  )

  set(config_cmake_global "${hunter_config_id_path}/config.cmake")

  if(EXISTS "${config_cmake_global}")
    return()
  endif()

  hunter_lock_directory("${hunter_config_id_path}" "")
  if(EXISTS "${config_cmake_global}")
    return()
  endif()

  set(config_cmake_torename "${hunter_config_id_path}/config.cmake.TORENAME")
  configure_file("${config_cmake_local}" "${config_cmake_torename}" COPYONLY)

  file(RENAME "${config_cmake_torename}" "${config_cmake_global}")
  hunter_status_debug("Config: ${config_cmake_global}")
  hunter_status_debug("Config sha1: ${HUNTER_GATE_CONFIG_SHA1}")
endfunction()

# Copyright (c) 2017 Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_test_string_not_empty)

function(hunter_get_project_files_to_load)
  hunter_test_string_not_empty("${HUNTER_SELF}")

  set(optional "")
  set(one PROJECT_NAME FILES)
  set(multiple COMPONENTS)

  # Introduce:
  # * x_PROJECT_NAME
  # * x_FILES
  # * x_COMPONENTS
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_PROJECT_NAME}" "" is_empty)
  if(is_empty)
    hunter_internal_error("PROJECT_NAME is empty")
  endif()

  get_property(
      git_submodule_dir
      GLOBAL
      PROPERTY
      "HUNTER_${x_PROJECT_NAME}_GIT_SUBMODULE_DIR"
  )

  if(git_submodule_dir)
    set(result_list "")
    list(
        APPEND
        result_list
        "${git_submodule_dir}/${x_PROJECT_NAME}-version.cmake"
    )

    set(hunter_cmake "${HUNTER_SELF}/cmake/projects/${x_PROJECT_NAME}/hunter.cmake")

    if(EXISTS "${hunter_cmake}")
      list(APPEND result_list "${hunter_cmake}")
    else()
      list(
          APPEND
          result_list
          "${git_submodule_dir}/${x_PROJECT_NAME}-download.cmake"
      )
    endif()

    set("${x_FILES}" "${result_list}" PARENT_SCOPE)
    return()
  endif()

  set(
      project_dir
      "${HUNTER_SELF}/cmake/projects/${x_PROJECT_NAME}"
  )
  if(NOT EXISTS "${project_dir}")
    hunter_internal_error("Project '${x_PROJECT_NAME}' not found")
  endif()
  if(NOT IS_DIRECTORY "${project_dir}")
    hunter_internal_error("Project '${x_PROJECT_NAME}' not found")
  endif()

  # Check components
  foreach(x ${x_COMPONENTS})
    set(dir "${project_dir}/${x}")
    if(NOT EXISTS "${dir}")
      hunter_internal_error(
          "Component '${x}' not found in project '${x_PROJECT_NAME}'"
      )
    endif()
    if(NOT IS_DIRECTORY "${dir}")
      hunter_internal_error(
          "Component '${x}' not found in project '${x_PROJECT_NAME}'"
      )
    endif()
  endforeach()

  set(result_list "${project_dir}/hunter.cmake")

  # Load components
  foreach(x ${x_COMPONENTS})
    list(APPEND result_list "${project_dir}/${x}/hunter.cmake")
  endforeach()

  set("${x_FILES}" "${result_list}" PARENT_SCOPE)
endfunction()

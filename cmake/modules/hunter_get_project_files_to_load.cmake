# Copyright (c) 2017 Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_internal_error)

function(hunter_get_project_files_to_load)
  hunter_assert_not_empty_string("${HUNTER_SELF}")

  set(optional "")
  set(one PROJECT_NAME FILES NEW_INJECTED_PACKAGE)
  set(multiple COMPONENTS)

  # Introduce:
  # * x_PROJECT_NAME
  # * x_FILES
  # * x_NEW_INJECTED_PACKAGE
  # * x_COMPONENTS
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PROJECT_NAME}")
  hunter_assert_not_empty_string("${x_FILES}")
  hunter_assert_not_empty_string("${x_NEW_INJECTED_PACKAGE}")

  set(project_dir "${HUNTER_SELF}/cmake/projects/${x_PROJECT_NAME}")
  set(hunter_cmake "${project_dir}/hunter.cmake")

  if(NOT EXISTS "${hunter_cmake}")
    hunter_status_debug("File not found (injected package): ${hunter_cmake}")
    set("${x_NEW_INJECTED_PACKAGE}" "TRUE" PARENT_SCOPE)
    return()
  endif()

  set("${x_NEW_INJECTED_PACKAGE}" "FALSE" PARENT_SCOPE)

  set(result_list "")
  list(APPEND result_list "${hunter_cmake}")

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
    set(component_cmake "${dir}/hunter.cmake")
    if(NOT EXISTS "${component_cmake}")
      hunter_internal_error(
          "File not found: ${component_cmake}"
      )
    endif()
    list(APPEND result_list "${component_cmake}")
  endforeach()

  set("${x_FILES}" "${result_list}" PARENT_SCOPE)
endfunction()

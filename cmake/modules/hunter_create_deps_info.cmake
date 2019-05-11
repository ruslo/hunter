# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_create_dependency_entry)
include(hunter_get_package_deps_recurse)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)

function(hunter_create_deps_info temp_deps_info)
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_NAME}")
  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)

  if(has_component)
    hunter_get_package_deps_recurse(
        PACKAGE "${HUNTER_PACKAGE_NAME}"
        COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
        RESULT dependencies_list
    )
  else()
    hunter_get_package_deps_recurse(
        PACKAGE "${HUNTER_PACKAGE_NAME}"
        RESULT dependencies_list
    )
  endif()

  set(temp_deps_info_nolf "${temp_deps_info}.NOLF")
  file(WRITE "${temp_deps_info_nolf}" "")

  foreach(dependency ${dependencies_list})
    string(REPLACE " " ";" dep_string "${dependency}")
    list(LENGTH dep_string dep_string_len)
    if(dep_string_len EQUAL 1)
      # only package
      hunter_create_dependency_entry(
          PACKAGE "${dep_string}"
          RESULT dep_entry
      )
    elseif(dep_string_len EQUAL 2)
      # package and component
      list(GET dep_string 0 package_name)
      list(GET dep_string 1 component_name)
      hunter_create_dependency_entry(
          PACKAGE "${package_name}"
          COMPONENT "${component_name}"
          RESULT dep_entry
      )
    else()
      hunter_internal_error(
          "Unexpected length ${dep_string_len} (string: ${dep_string})"
      )
    endif()
    file(APPEND "${temp_deps_info_nolf}" "${dep_entry}\n")
  endforeach()

  # About '@ONLY': no substitutions expected but COPYONLY can't be
  # used with NEWLINE_STYLE
  configure_file(
      "${temp_deps_info_nolf}"
      "${temp_deps_info}"
      @ONLY
      NEWLINE_STYLE LF
  )
endfunction()

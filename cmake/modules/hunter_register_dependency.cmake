# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_register_dependency)
  set(one DEPENDS_ON_PACKAGE DEPENDS_ON_COMPONENT)
  set(multiple PACKAGE)

  cmake_parse_arguments(hunter "" "${one}" "${multiple}" ${ARGV})
  # -> hunter_PACKAGE
  # -> hunter_DEPENDS_ON_PACKAGE
  # -> hunter_DEPENDS_ON_COMPONENT

  string(
      COMPARE NOTEQUAL "${hunter_DEPENDS_ON_PACKAGE}" "" has_depends_on_package
  )
  string(
      COMPARE
      NOTEQUAL
      "${hunter_DEPENDS_ON_COMPONENT}"
      ""
      has_depends_on_component
  )
  string(COMPARE NOTEQUAL "${hunter_UNPARSED_ARGUMENTS}" "" has_unparsed)

  if(NOT has_depends_on_package)
    hunter_internal_error("No DEPENDS_ON_PACKAGE")
  endif()

  if(has_unparsed)
    hunter_internal_error("Unparsed: ${hunter_UNPARSED_ARGUMENTS}")
  endif()

  list(LENGTH hunter_PACKAGE package_len)
  if(package_len EQUAL 0)
    return()
  elseif(package_len EQUAL 1)
    set(has_package_component FALSE)
    set(hunter_PACKAGE_NAME "${hunter_PACKAGE}")
  elseif(package_len EQUAL 2)
    set(has_package_component TRUE)
    list(GET hunter_PACKAGE 0 hunter_PACKAGE_NAME)
    list(GET hunter_PACKAGE 1 hunter_PACKAGE_COMPONENT)
  else()
    hunter_internal_error("Incorrect PACKAGE: ${hunter_PACKAGE}")
  endif()

  hunter_assert_not_empty_string("${hunter_PACKAGE_NAME}")
  hunter_assert_not_empty_string("${HUNTER_CONFIG_ID_PATH}")
  set(
      dependencies_dir
      "${HUNTER_CONFIG_ID_PATH}/Build/${hunter_PACKAGE_NAME}"
  )
  if(has_package_component)
    set(
        dependencies_dir
        "${dependencies_dir}/__${hunter_PACKAGE_COMPONENT}"
    )
  endif()
  set(dependencies_dir "${dependencies_dir}/Dependencies")
  set(dependencies_dir "${dependencies_dir}/${hunter_DEPENDS_ON_PACKAGE}")
  if(has_depends_on_component)
    set(dependencies_dir "${dependencies_dir}/${hunter_DEPENDS_ON_COMPONENT}")
  endif()

  set(x "${hunter_PACKAGE_NAME}")
  if(has_package_component)
    set(x "${x} (component: ${hunter_PACKAGE_COMPONENT})")
  endif()

  set(y "${hunter_DEPENDS_ON_PACKAGE}")
  if(has_depends_on_component)
    set(y "${y} (component: ${hunter_DEPENDS_ON_COMPONENT})")
  endif()

  hunter_status_debug("Registering dependency:")
  hunter_status_debug("  package: ${x}")
  hunter_status_debug("  depends on: ${y}")

  set(dep_file "${dependencies_dir}/__dep")
  hunter_status_debug("Making: ${dep_file}")
  file(WRITE "${dep_file}" "")
endfunction()

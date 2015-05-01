# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_create_dependency_entry)
include(hunter_internal_error)
include(hunter_test_string_not_empty)

# Go to directory '<toolchain-id>/Build/<package>/__<component>/Dependencies'
# and if package depends on something (except list x_READY) then add this
# package to the x_DEPENDS list (output) and process next package.
# If package doesn't depends on anything add it to x_FREE (nothing or all
# dependencies in list x_READY). See directory 'tests' for example.
function(hunter_process_dependency_node)
  set(one PACKAGE COMPONENT DEPENDS FREE)
  set(multiple READY)
  cmake_parse_arguments(x "" "${one}" "${multiple}" "${ARGV}")
  # x_PACKAGE package need to be processed (IN)
  # x_COMPONENT optional component (IN)
  # x_READY list of ready packages (IN)
  # x_DEPENDS list of packages that depends on other package (OUT)
  # x_FREE list of packages that doesn't depends on anything (OUT)

  hunter_test_string_not_empty("${x_PACKAGE}")
  hunter_test_string_not_empty("${x_DEPENDS}")
  hunter_test_string_not_empty("${x_FREE}")

  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_ID_PATH}")

  string(COMPARE NOTEQUAL "${x_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  set(dep_dir "${HUNTER_TOOLCHAIN_ID_PATH}/Build/${x_PACKAGE}")
  if(has_component)
    set(dep_dir "${dep_dir}/__${x_COMPONENT}")
  endif()
  set(dep_dir "${dep_dir}/Dependencies")

  set(package_dependencies "")
  set(depends_all "")
  set(free_all "")

  file(GLOB_RECURSE dep_file_list RELATIVE "${dep_dir}" "${dep_dir}/*/__dep")
  foreach(curr_dep_file ${dep_file_list})
    get_filename_component(curr_dep_dir "${curr_dep_file}" DIRECTORY)
    string(REPLACE "/" ";" curr_dep_dir "${curr_dep_dir}")
    list(LENGTH curr_dep_dir dep_len)
    if(dep_len EQUAL 1)
      # format: <package> <sha1>
      list(GET curr_dep_dir 0 package)
      set(component "")
    else()
      # format: <package> <component> <sha1>
      list(GET curr_dep_dir 0 package)
      list(GET curr_dep_dir 1 component)
    else()
      hunter_internal_error("Incorrect directory")
    endif()

    hunter_create_dependency_entry(
        PACKAGE "${package}" COMPONENT "${component}" RESULT current_item
    )
    if(current_item STREQUAL "")
      hunter_fatal_error(
          "Cache not found: ${package}/${component}"
          WIKI "error.cache.file.not.found"
      )
    endif()

    list(APPEND package_dependencies ${current_item})

    hunter_process_dependency_node(
        PACKAGE "${package}"
        COMPONENT "${component}"
        READY "${x_READY}"
        DEPENDS depends_out
        FREE free_out
    )
    list(APPEND depends_all "${depends_out}")
    list(APPEND free_all "${free_out}")
  endforeach()

  list(REMOVE_DUPLICATES package_dependencies)
  list(REMOVE_DUPLICATES free_all)
  list(REMOVE_DUPLICATES depends_all)

  list(REMOVE_ITEM package_dependencies ${x_READY} "")

  hunter_create_dependency_entry(
      PACKAGE "${x_PACKAGE}" COMPONENT "${x_COMPONENT}" RESULT this_item
  )
  if(this_item STREQUAL "")
    hunter_fatal_error(
        "Cache not found: ${x_PACKAGE}/${x_COMPONENT}"
        WIKI "error.cache.file.not.found"
    )
  endif()

  list(LENGTH package_dependencies dep_len)

  if(dep_len EQUAL 0)
    list(APPEND free_all ${this_item})
  else()
    list(APPEND depends_all ${this_item})
  endif()

  list(REMOVE_ITEM depends_all ${x_READY} "")
  list(REMOVE_ITEM free_all ${x_READY} "")
  list(REMOVE_ITEM free_all ${depends_all} "")

  list(REMOVE_DUPLICATES free_all)
  list(REMOVE_DUPLICATES depends_all)

  list(SORT free_all)
  list(SORT depends_all)

  set(${x_FREE} "${free_all}" PARENT_SCOPE)
  set(${x_DEPENDS} "${depends_all}" PARENT_SCOPE)
endfunction()

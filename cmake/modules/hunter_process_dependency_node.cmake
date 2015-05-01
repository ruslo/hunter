# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

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

  set(top_dir "${HUNTER_TOOLCHAIN_ID_PATH}/Build")

  set(dep_dir "${top_dir}/${x_PACKAGE}")
  if(has_component)
    set(dep_dir "${dep_dir}/__${x_COMPONENT}")
  endif()
  set(cache_file "${dep_dir}/cache.sha1")
  set(dep_dir "${dep_dir}/Dependencies")

  if(NOT EXISTS "${cache_file}")
    hunter_fatal_error(
        "Not found: ${cache_file}" WIKI "error.cache.file.not.found"
    )
  endif()
  file(READ "${cache_file}" x_SHA1)

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
      set(curr_has_component FALSE)
    else()
      # format: <package> <component> <sha1>
      list(GET curr_dep_dir 0 package)
      list(GET curr_dep_dir 1 component)
      set(curr_has_component TRUE)
    else()
      hunter_internal_error("Incorrect directory")
    endif()

    set(cache_file "${top_dir}/${package}")
    if(curr_has_component)
      set(cache_file "${top_dir}/${package}/__${component}")
    endif()
    set(cache_file "${cache_file}/cache.sha1")

    if(NOT EXISTS "${cache_file}")
      hunter_fatal_error(
          "Not found: ${cache_file}" WIKI "error.cache.file.not.found"
      )
    endif()
    file(READ "${cache_file}" cache_sha1)

    if(curr_has_component)
      list(APPEND package_dependencies "${package} ${component} ${cache_sha1}")
    else()
      list(APPEND package_dependencies "${package} ${cache_sha1}")
    endif()

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

  if(has_component)
    set(this_item "${x_PACKAGE} ${x_COMPONENT} ${x_SHA1}")
  else()
    set(this_item "${x_PACKAGE} ${x_SHA1}")
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

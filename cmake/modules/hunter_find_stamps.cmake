# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_find_stamps build_dir)
  hunter_status_debug("Try to find stamps in directory: ${build_dir}")

  file(GLOB prefix_dirs "${build_dir}/*-prefix")
  string(COMPARE EQUAL "${prefix_dirs}" "" is_empty)
  if(is_empty)
    hunter_internal_error("`*-prefix` directory not found in `${build_dir}`")
  endif()

  foreach(prefix_dir ${prefix_dirs})
    file(GLOB stamp_dir "${prefix_dir}/src/*-stamp")
    string(COMPARE EQUAL "${stamp_dir}" "" is_empty)
    if(is_empty)
      hunter_internal_error(
          "`src/*-stamp` directory not found in `${prefix_dir}`"
      )
    endif()

    file(GLOB stamp_done "${stamp_dir}/*-done")
    file(GLOB stamp_done_recurse "${stamp_dir}/*/*-done")

    if(EXISTS "${stamp_done}")
      hunter_status_debug("Stamp 'done' location: ${stamp_done}")
    elseif(EXISTS "${stamp_done_recurse}")
      hunter_status_debug("Stamp 'done' location: ${stamp_done_recurse}")
    else()
      hunter_internal_error("Stamp 'done' not found in directory: ${stamp_dir}")
    endif()
  endforeach()
endfunction()

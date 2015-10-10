# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_print_cmd)
include(hunter_status_debug)
include(hunter_status_print)

function(hunter_pack_directory dir_to_pack dest_dir result_sha1)
  file(MAKE_DIRECTORY "${dest_dir}")
  set(temp "${dest_dir}/cache.tar.bz2")

  set(cmd "${CMAKE_COMMAND}" "-E" "tar")
  if(HUNTER_STATUS_DEBUG)
    list(APPEND cmd "cvjf")
  else()
    list(APPEND cmd "cjf")
  endif()

  list(APPEND cmd "${temp}" "--")

  file(GLOB dir_list RELATIVE "${dir_to_pack}" "${dir_to_pack}/*")

  list(LENGTH dir_list len)
  if(len EQUAL 0)
    hunter_internal_error("No objects in directory: ${dir_to_pack}")
  endif()

  file(GLOB_RECURSE files_list "${dir_to_pack}/*")
  string(COMPARE EQUAL "${files_list}" "" no_files_found)
  if(no_files_found)
    hunter_internal_error("Package has not files to pack")
  endif()

  foreach(x ${dir_list})
    list(APPEND cmd "${x}")
  endforeach()

  if(HUNTER_STATUS_DEBUG)
    set(logging_params "")
  elseif(HUNTER_STATUS_PRINT)
    set(logging_params "")
  else()
    set(logging_params "OUTPUT_QUIET")
  endif()

  hunter_print_cmd("${dir_to_pack}" "${cmd}")

  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${dir_to_pack}"
      RESULT_VARIABLE packing_result
      ${logging_params}
  )

  if(packing_result EQUAL 0)
    hunter_status_debug("Packing successful: ${temp}")
  else()
    hunter_internal_error("Packing failed")
  endif()

  file(SHA1 "${temp}" archive_sha1)
  set(dest_archive "${dest_dir}/${archive_sha1}.tar.bz2")
  file(RENAME "${temp}" "${dest_archive}")

  set("${result_sha1}" "${archive_sha1}" PARENT_SCOPE)

  hunter_status_print("Cache saved: ${dest_archive}")
endfunction()

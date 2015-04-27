# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_print_cmd)
include(hunter_status_debug)

function(hunter_unpack_directory archive dest_dir)
  file(MAKE_DIRECTORY "${dest_dir}")

  set(cmd "${CMAKE_COMMAND}" "-E" "tar")
  if(HUNTER_STATUS_DEBUG)
    list(APPEND cmd "xvf")
  else()
    list(APPEND cmd "xf")
  endif()
  list(APPEND cmd "${archive}")

  if(HUNTER_STATUS_DEBUG)
    set(logging_params "")
  elseif(HUNTER_STATUS_PRINT)
    set(logging_params "")
  else()
    set(logging_params "OUTPUT_QUIET")
  endif()

  hunter_status_debug("Unpacking:")
  hunter_status_debug("  ${archive}")
  hunter_status_debug("  -> ${dest_dir}")

  hunter_print_cmd("${dest_dir}" "${cmd}")

  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${dest_dir}"
      RESULT_VARIABLE unpacking_result
      ${logging_params}
  )

  if(unpacking_result EQUAL 0)
    hunter_status_debug("Unpacked successfully")
  else()
    hunter_internal_error("Unpack failed")
  endif()
endfunction()

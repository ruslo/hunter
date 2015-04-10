# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)

function(hunter_print_cmd work_dir cmd)
  set(msg "[${work_dir}] >")
  foreach(arg ${cmd})
    set(msg "${msg} \"${arg}\"")
  endforeach()
  hunter_status_debug("${msg}")
endfunction()

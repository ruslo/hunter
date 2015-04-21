# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_gate_settings varname)
  set(settings "")
  foreach(
      hunter_var
      HUNTER_CACHED_ROOT
      HUNTER_SHA1
      HUNTER_CONFIG_SHA1
      HUNTER_VERSION
      HUNTER_TOOLCHAIN_SHA1
      HUNTER_STATUS_DEBUG
      HUNTER_JOBS_NUMBER
  )
    list(APPEND settings "-D${hunter_var}=${${hunter_var}}")
  endforeach()

  if(NOT HUNTER_GATE_DONE)
    get_property(_hunter_gate_done GLOBAL PROPERTY HUNTER_GATE_DONE SET)
    if(NOT _hunter_gate_done)
      hunter_internal_error("HUNTER_GATE_DONE is OFF")
    endif()
  endif()

  list(APPEND settings "-DHUNTER_GATE_DONE=YES")
  set("${varname}" "${settings}" PARENT_SCOPE)
endfunction()

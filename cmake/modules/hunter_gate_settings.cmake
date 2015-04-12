# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

function(hunter_gate_settings varname)
  set(settings "")
  foreach(
      hunter_var
      HUNTER_CACHED_ROOT
      HUNTER_SHA1
      HUNTER_CONFIG_SHA1
      HUNTER_VERSION
      HUNTER_TOOLCHAIN_SHA1
  )
    list(APPEND settings "-D${hunter_var}=${${hunter_var}}")
  endforeach()
  list(APPEND settings "-DHUNTER_GATE_DONE=YES")
  set("${varname}" "${settings}" PARENT_SCOPE)
endfunction()

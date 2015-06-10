# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# Adds to append_result 
#   AR=${CMAKE_AR}
#   AS=${CMAKE_ASM_COMPILER}
#   LD=${CMAKE_LINKER}
#   NM=${CMAKE_NM}
#   OBJCOPY=${CMAKE_OBJCOPY}
#   OBJDUMP=${CMAKE_OBJDUMP}
#   RANLIB=${CMAKE_RANLIB}
#   STRIP=${CMAKE_STRIP}
#   CPP=${CMAKE_C_PREPROCESSOR}
#   CC=${CMAKE_C_COMPILER}
#   CXX=${CMAKE_CXX_COMPILER}
#
function(hunter_autotools_append_toolchain_binaries append_result)
  if(CMAKE_AR)
    set(_configure_opts ${_configure_opts} AR=${CMAKE_AR})
  endif()
  if(CMAKE_ASM_COMPILER)
    set(_configure_opts ${_configure_opts} AS=${CMAKE_ASM_COMPILER})
  endif()
  if(CMAKE_LINKER)
    set(_configure_opts ${_configure_opts} LD=${CMAKE_LINKER})
  endif()
  if(CMAKE_NM)
    set(_configure_opts ${_configure_opts} NM=${CMAKE_NM})
  endif()
  if(CMAKE_OBJCOPY)
    set(_configure_opts ${_configure_opts} OBJCOPY=${CMAKE_OBJCOPY})
  endif()
  if(CMAKE_OBJDUMP)
    set(_configure_opts ${_configure_opts} OBJDUMP=${CMAKE_OBJDUMP})
  endif()
  if(CMAKE_RANLIB)
    set(_configure_opts ${_configure_opts} RANLIB=${CMAKE_RANLIB})
  endif()
  if(CMAKE_STRIP)
    set(_configure_opts ${_configure_opts} STRIP=${CMAKE_STRIP})
  endif()
  if(CMAKE_C_PREPROCESSOR)
    set(_configure_opts ${_configure_opts} CPP=${CMAKE_C_PREPROCESSOR})
  endif()
  if(CMAKE_C_COMPILER)
    set(_configure_opts ${_configure_opts} CC=${CMAKE_C_COMPILER})
  endif()
  if(CMAKE_CXX_COMPILER)
    set(_configure_opts ${_configure_opts} CXX=${CMAKE_CXX_COMPILER})
  endif()
  string(STRIP "${_configure_opts}" _configure_opts)
  string(COMPARE NOTEQUAL "${_configure_opts}" "" has_changes)
  if(has_changes)
    set(${append_result} ${${append_result}} ${_configure_opts} PARENT_SCOPE)
  endif()
endfunction()

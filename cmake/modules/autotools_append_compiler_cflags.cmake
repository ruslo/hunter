# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# Adds to append_result 
#   CFLAGS=${cflags} ${CMAKE_C_FLAGS}
#
function(autotools_append_compiler_cflags cflags append_result)
  #C Compiler Flags (defines or include directories should not be needed here)
  set(_cflags "${cflags} ${CMAKE_C_FLAGS}")
  string(STRIP "${_cflags}" _cflags)
  string(COMPARE NOTEQUAL "${_cflags}" "" has_cflags)
  if (has_cflags)
		set(${append_result} ${${append_result}} CFLAGS=${_cflags} PARENT_SCOPE)
  endif()
endfunction()

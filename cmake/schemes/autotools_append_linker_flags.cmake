# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# Adds to append_result 
#   LDFLAGS=${ldflags} 

function(autotools_append_linker_flags ldflags append_result)
  #Linker flags
  string(STRIP "${ldflags}" ldflags)
  string(COMPARE NOTEQUAL "${ldflags}" "" has_ldflags)
  if(has_ldflags)
    set(${append_result} ${${append_result}} LDFLAGS=${ldflags} PARENT_SCOPE)
  endif()
endfunction()

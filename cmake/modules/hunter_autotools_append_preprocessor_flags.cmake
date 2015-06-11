# Copyright (c) 2015 Ruslan Baratov, Alexandre Pretyman
# All rights reserved.
#
# Adds to append_result
#   CPPFLAGS=${cppflags} [-D${COMPILE_DEFINITIONS}] [-I${INCLUDE_DIRECTORIES}]
#
function(hunter_autotools_append_preprocessor_flags cppflags append_result)
  #C Preprocessor flags
  get_directory_property(defs COMPILE_DEFINITIONS)
  foreach(def ${defs})
    set(_cppflags "${_cppflags} -D${def}")
  endforeach()

  get_directory_property(include_dirs INCLUDE_DIRECTORIES)
  foreach(include_dir ${include_dirs})
    set(_cppflags "${_cppflags} ${CMAKE_INCLUDE_SYSTEM_FLAG_CXX} ${include_dir}")
  endforeach()

  set(_cppflags "${_cppflags} ${cppflags}")
  string(STRIP "${_cppflags}" cppflags)
  string(COMPARE NOTEQUAL "${_cppflags}" "" has_cppflags)
  if(has_cppflags)
    set(${append_result} ${${append_result}} CPPFLAGS=${_cppflags} PARENT_SCOPE)
  endif()
endfunction()


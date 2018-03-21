# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

# If unpacked archive has only one directory at the top then step into it.
# Same logic as for ExternalProject_Add:
# * https://github.com/Kitware/CMake/blob/1da3f3e916de5ac6e64b473575d02bb3d358fc76/Modules/ExternalProject.cmake#L1551-L1559

function(hunter_step_into_unpacked_directory unpacked_directory output)
  file(GLOB contents "${unpacked_directory}/*")
  list(REMOVE_ITEM contents "${unpacked_directory}/.DS_Store")
  list(LENGTH contents n)

  if(n EQUAL "1" AND IS_DIRECTORY "${contents}")
    set("${output}" "${contents}" PARENT_SCOPE)
  else()
    set("${output}" "${unpacked_directory}")
  endif()
endfunction()

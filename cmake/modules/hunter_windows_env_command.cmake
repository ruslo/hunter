# Copyright (c) 2015 Sumedh Ghaisas, Ruslan Baratov
# All rights reserved.

include(hunter_windows_to_snf_filename)

#Set command to change environment variables to 8.3 filenames to windows
function(hunter_windows_env_command variable_name)
  
  hunter_windows_to_snf_filename(${CMAKE_C_COMPILER} "CMAKE_C_COMPILER_SNF")
  hunter_windows_to_snf_filename(${CMAKE_CXX_COMPILER} "CMAKE_CXX_COMPILER_SNF")
  hunter_windows_to_snf_filename(${CMAKE_RC_COMPILER} "CMAKE_RC_COMPILER_SNF")
  
  set(${variable_name} "set" "cc=${CMAKE_C_COMPILER_SNF}" "&&" "set" "cxx=${CMAKE_CXX_COMPILER_SNF}" "&&" "set" "rc=${CMAKE_RC_COMPILER_SNF}" PARENT_SCOPE)
 
endfunction() 

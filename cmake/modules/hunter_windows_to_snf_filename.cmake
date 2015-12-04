# Copyright (c) 2015 Sumedh Ghaisas, Ruslan Baratov
# All rights reserved.

# CMAKE function to convert windows log filename to 8.3 filename
# For reference check http://stackoverflow.com/a/10227715/2288008
function(hunter_windows_to_snf_filename path new_path_variable)
  if(NOT CMAKE_HOST_WIN32)
    hunter_internal_error("Expecting Windows platform")
  endif()
  
  set(conversion_cmd
    "cmd" 
    "/c" 
    "for" 
    "%A" 
    "in" 
    ("${path}") 
    "do" 
    "@echo"
    "%~sA"
	)
  
  execute_process(
    COMMAND ${conversion_cmd}
    RESULT_VARIABLE conversion_result
    OUTPUT_VARIABLE converted_path
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  
  if(NOT conversion_result EQUAL 0)
    hunter_fatal_error("Command to convert path ${path} to 8.3 Filename failed. Command is ${conversion_cmd}")
  endif()
  
  string(REGEX REPLACE "[\\]" "/" converted_path ${converted_path})  

  set(${new_path_variable} "${converted_path}" PARENT_SCOPE)
endfunction()

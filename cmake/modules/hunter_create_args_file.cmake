# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)
include(hunter_user_error)

# This function will create from list of options "A=value1;B=value2;C=value3"
# file with equivalent 'set' commands:
#   set("A" "value1" CACHE INTERNAL "")
#   set("B" "value2" CACHE INTERNAL "")
#   set("C" "value3" CACHE INTERNAL "")
# Note 1. List of variables allowed, so "A=value1;value2" must be equivalent to:
#   set("A" "value1" CACHE INTERNAL "")
#   set("A" "${A}" "value2" CACHE INTERNAL "")
# Note 2. Type of variable is allowed but not used, so "A:BOOL=value1" must be
# equivalent to:
#   set("A" "value1" CACHE INTERNAL "")
function(hunter_create_args_file args filename)
  set(bad_message "Bad `hunter_config` format")
  # Example:
  #   args = "A:BOOL=value1;B=value2;value3;C=value4"
  # =>
  #   'entry' will have values:
  #       "A:BOOL=value1", "B=value2", "value3", "C=value4"
  #   'var_name' will have values:
  #       "A", "B", "C"
  #   'var_value' will have values:
  #       "value1", "value2", "value3", "value4"
  file(REMOVE "${filename}")
  file(WRITE "${filename}" "") # create empty file if no option
  set(var_name "")
  foreach(entry ${args})
    string(FIND "${entry}" "=" update_var)
    if(update_var EQUAL -1)
      # There is no '=' symbol - appending mode
      if(NOT var_name)
        hunter_user_error(
            "${bad_message} (expected '=' symbol): ${args}"
        )
      endif()
      set(var_value "${entry}")
      ### Check not empty --
      string(COMPARE EQUAL "${var_name}" "" is_empty)
      if(is_empty)
        hunter_user_error(
            "${bad_message} (variable name is empty): ${args}"
        )
      endif()
      string(COMPARE EQUAL "${var_value}" "" is_empty)
      if(is_empty)
        hunter_user_error(
            "${bad_message} (variable value is empty): ${args}"
        )
      endif()
      ### -- end
      file(APPEND "${filename}" "set(")
      file(
          APPEND
          "${filename}"
          "\"${var_name}\" \"\${${var_name}}\" \"${var_value}\""
      )
      file(APPEND "${filename}" " CACHE INTERNAL \"\")\n")
      hunter_status_debug(
          "Add extra CMake args: '${var_name}' += '${var_value}'"
      )
    else()
      # Format <name>=<value>
      string(REGEX MATCH "=.*=" bad "${entry}")
      if(bad)
        hunter_user_error(
            "${bad_message} (two '=' symbols): ${args}"
        )
      endif()
      string(REGEX REPLACE "=.*" "" var_name "${entry}")
      string(REGEX REPLACE ".*=" "" var_value "${entry}")

      string(REGEX MATCH ":.*:" bad "${var_name}")
      if(bad)
        hunter_user_error(
            "${bad_message} (two ':' symbols in variable name): ${args}"
        )
      endif()
      string(REGEX REPLACE ":.*" "" var_name "${var_name}")

      ### Check not empty --
      string(COMPARE EQUAL "${var_name}" "" is_empty)
      if(is_empty)
        hunter_user_error(
            "${bad_message} (variable name is empty): ${args}"
        )
      endif()
      string(COMPARE EQUAL "${var_value}" "" is_empty)
      if(is_empty)
        hunter_user_error(
            "${bad_message} (variable value is empty): ${args}"
        )
      endif()
      ### -- end

      file(APPEND "${filename}" "set(")
      file(APPEND "${filename}" "\"${var_name}\" \"${var_value}\"")
      file(APPEND "${filename}" " CACHE INTERNAL \"\")\n")
      hunter_status_debug(
          "Add extra CMake args: '${var_name}' = '${var_value}'"
      )
    endif()
  endforeach()
endfunction()

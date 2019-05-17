# Copyright (c) 2015, 2018 Ruslan Baratov
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
  set(filename_nolf "${filename}.NOLF")
  file(REMOVE "${filename_nolf}")
  file(WRITE "${filename_nolf}" "") # create empty file if no option
  set(var_name "")
  foreach(entry ${args})
    set(appending_mode FALSE)

    string(FIND "${entry}" "=" equal_symbol_index)
    if(equal_symbol_index EQUAL -1)
      # There is no '=' symbol - appending mode
      set(appending_mode TRUE)
    endif()

    string(REGEX MATCH "^--.*" starts_with_double_dash "${entry}")
    if(NOT "${starts_with_double_dash}" STREQUAL "")
      # Assumed that variable name doesn't start with '--' and we are appending.
      # Needed to pass options like `--foo=a,b,c,d`
      set(appending_mode TRUE)
    endif()

    if(appending_mode)
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
      file(APPEND "${filename_nolf}" "set(")
      file(
          APPEND
          "${filename_nolf}"
          "\"${var_name}\" \"\${${var_name}}\" \"${var_value}\""
      )
      file(APPEND "${filename_nolf}" " CACHE INTERNAL \"\")\n")
      hunter_status_debug(
          "Add extra CMake args: '${var_name}' += '${var_value}'"
      )
    else()
      # Format <name>=<value>
      # Note that we can have more than one '=' sign, e.g. A=-opt=value1
      string(REGEX REPLACE "=.*" "" var_name "${entry}")

      # 'string(REGEX REPLACE' will replace as much patterns as it found so
      # it's not possible to replace only one '=' as we need.
      string(LENGTH "${var_name}" var_name_len)
      math(EXPR value_begin "${var_name_len} + 1")
      string(SUBSTRING "${entry}" "${value_begin}" -1 var_value)

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

      file(APPEND "${filename_nolf}" "set(")

      if("${var_value}" STREQUAL "\"\"")
        file(APPEND "${filename_nolf}" "\"${var_name}\" \"\"")
      else()
        file(APPEND "${filename_nolf}" "\"${var_name}\" \"${var_value}\"")
      endif()

      file(APPEND "${filename_nolf}" " CACHE INTERNAL \"\")\n")
      hunter_status_debug(
          "Add extra CMake args: '${var_name}' = '${var_value}'"
      )
    endif()
  endforeach()

  # About '@ONLY': no substitutions expected but COPYONLY can't be
  # used with NEWLINE_STYLE
  configure_file(
      "${filename_nolf}"
      "${filename}"
      @ONLY
      NEWLINE_STYLE LF
  )
endfunction()

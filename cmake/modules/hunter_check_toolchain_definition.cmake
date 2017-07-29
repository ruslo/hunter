# Copyright (c) 2016 NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_test_string_not_empty)

function(hunter_check_toolchain_definition)
  set(function_name "hunter_check_toolchain_definition")
  set(function_synopsis "${function_name}(NAME definition [DEFINED out_is_defined] [VALUE out_value])")

  # parse arguments
  set(one_value_args NAME DEFINED VALUE)
  cmake_parse_arguments(hunter_ct_arg "" "${one_value_args}" "" ${ARGV})

  string(COMPARE NOTEQUAL "${hunter_ct_arg_NAME}"    "" arg_NAME)
  string(COMPARE NOTEQUAL "${hunter_ct_arg_DEFINED}" "" arg_DEFINED)
  string(COMPARE NOTEQUAL "${hunter_ct_arg_VALUE}"   "" arg_VALUE)
  # No free arguments allowed
  list(LENGTH hunter_ct_arg_UNPARSED_ARGUMENTS hunter_ct_len)
  if(NOT hunter_ct_len EQUAL 0)
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " expected no free arguments '${hunter_ct_arg_UNPARSED_ARGUMENTS}'."
      " Synopsis: ${function_synopsis}"
    )
  endif()
  # option NAME is mandatory
  if(NOT arg_NAME)
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " option 'NAME' with one argument is mandatory."
      " Synopsis: ${function_synopsis}"
    )
  endif()
  string(FIND "${hunter_ct_arg_NAME}" " " arg_NAME_whitespace_position)
  if(NOT arg_NAME_whitespace_position EQUAL -1)
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " definition '${hunter_ct_arg_NAME}' with whitespaces not allowed."
    )
  endif()
  set(definition "${hunter_ct_arg_NAME}")

  # the toolchain path must be set
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_ID_PATH}")
  set(TOOLCHAIN_INFO_FILE "${HUNTER_TOOLCHAIN_ID_PATH}/toolchain.info")

  # read toolchain.info file into memory, each line a entry in a list
  file(STRINGS "${TOOLCHAIN_INFO_FILE}" toolchain_contents)

  # clean ouptut variables
  set(is_defined NO)
  set(defined_value)

  foreach(line ${toolchain_contents})
    # find the specified define
    string(REGEX MATCH "^#define ${definition} .*$" match "${line}")
    if(match)
      # check for double definition
      if(is_defined)
        hunter_internal_error(
          "'${function_name}' incorrect toolchain.info file,"
          " double definition of define '${definition}'"
          " in file '${TOOLCHAIN_INFO_FILE}'."
        )
      endif()
      # definition found
      set(is_defined YES)
      # extract the definition
      string(REGEX REPLACE "^#define ${definition} " "" defined_value "${match}")
    endif()
  endforeach()

  # set output_var to found definition
  if(arg_DEFINED)
    set(${hunter_ct_arg_DEFINED} ${is_defined} PARENT_SCOPE)
  endif()
  if(arg_VALUE)
    set(${hunter_ct_arg_VALUE} ${defined_value} PARENT_SCOPE)
  endif()
endfunction()

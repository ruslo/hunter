# Copyright (c) 2013, Ruslan Baratov
# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)

function(hunter_cmake_args package)
  hunter_assert_not_empty_string("${package}")

  set(optional "")
  set(one "")
  set(multiple CMAKE_ARGS)

  # Introduce:
  # * x_CMAKE_ARGS
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGN}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_CMAKE_ARGS}")

  set("__HUNTER_DEFAULT_CMAKE_ARGS_${package}" "${x_CMAKE_ARGS}" PARENT_SCOPE)
endfunction()

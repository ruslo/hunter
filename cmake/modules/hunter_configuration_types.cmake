# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)
include(hunter_assert_empty_string)

function(hunter_configuration_types package)
  hunter_assert_not_empty_string("${package}")

  set(optional "")
  set(one "")
  set(multiple CONFIGURATION_TYPES)

  # Introduce:
  # * x_CONFIGURATION_TYPES
  cmake_parse_arguments(x "" "" "${multiple}" "${ARGN}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")
  hunter_assert_not_empty_string("${x_CONFIGURATION_TYPES}")

  set(
      "__HUNTER_DEFAULT_CONFIGURATION_TYPES_${package}"
      "${x_CONFIGURATION_TYPES}"
      PARENT_SCOPE
  )
endfunction()

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
include(hunter_parse_boost_config_macros)
project(test-append-boost-config-macros-script)

set(HUNTER_GLOBAL_SCRIPT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../scripts")
set(BOOST_CONFIG_ROOT "${CMAKE_CURRENT_BINARY_DIR}/boost/config")
set(BOOST_USER_CONFIG "${BOOST_CONFIG_ROOT}/user.hpp")

function(test_append_boost_config_macros expected_boost_user_config_content)

  hunter_parse_boost_config_macros(BOOST_CONFIG_MACROS ${ARGN})
  configure_file(
    "${HUNTER_GLOBAL_SCRIPT_DIR}/append-boost-config-macros.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/append-boost-config-macros.cmake"
    @ONLY
  )

  file(MAKE_DIRECTORY "${BOOST_CONFIG_ROOT}")
  file(WRITE "${BOOST_USER_CONFIG}" "")
  execute_process(
    COMMAND
      "${CMAKE_COMMAND}" -P append-boost-config-macros.cmake
    WORKING_DIRECTORY
      "${CMAKE_CURRENT_BINARY_DIR}"
  )
  file(READ "${BOOST_USER_CONFIG}" boost_user_config_content)
  string(
    COMPARE NOTEQUAL
      "${boost_user_config_content}"
      "${expected_boost_user_config_content}"
      diff
  )
  if(diff)
    message(
      FATAL_ERROR "TEST FAIL: ${ARGN}\n"
        "boost user config content:\n"
        "${boost_user_config_content}\n"
        "expected:\n"
        "${expected_boost_user_config_content}\n"
    )
  else()
    message("TEST PASS: ${ARGN}")
  endif()
endfunction(test_append_boost_config_macros)

test_append_boost_config_macros(
[=[

#define BOOST_REGEX_MATCH_EXTRA

#define BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS

#define BOOST_MPL_LIMIT_LIST_SIZE 3
]=]
CONFIG_MACRO=BOOST_REGEX_MATCH_EXTRA;BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
CONFIG_MACRO_BOOST_MPL_LIMIT_LIST_SIZE=3
)

test_append_boost_config_macros(
[=[

#define BOOST_MPL_LIMIT_LIST_SIZE 3

#define BOOST_REGEX_MATCH_EXTRA

#define BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
]=]
CONFIG_MACRO_BOOST_MPL_LIMIT_LIST_SIZE=3
CONFIG_MACRO=BOOST_REGEX_MATCH_EXTRA;BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
)

test_append_boost_config_macros("" "")

test_append_boost_config_macros(
[=[

#define CM1
]=]
CONFIG_MACRO=CM1
)

test_append_boost_config_macros(
[=[

#define CM1

#define CM2
]=]
CONFIG_MACRO=CM1;CM2
)

test_append_boost_config_macros(
[=[

#define CM1

#define CM2
]=]
CONFIG_MACRO=CM1 CM2
)

test_append_boost_config_macros(
[=[

#define CM1 1
]=]
CONFIG_MACRO_CM1=1
)

test_append_boost_config_macros(
[=[

#define CM1 1

#define CM2 1
]=]
CONFIG_MACRO_CM1=1 CONFIG_MACRO_CM2=1
)

test_append_boost_config_macros(
[=[

#define CM3

#define CM4

#define CM1 1

#define CM2 1
]=]
CONFIG_MACRO=CM3;CM4 CONFIG_MACRO_CM1=1 CONFIG_MACRO_CM2=1
)

test_append_boost_config_macros(
[=[

#define CM1 1

#define CM2 1

#define CM3

#define CM4
]=]
CONFIG_MACRO_CM1=1 CONFIG_MACRO_CM2=1 CONFIG_MACRO=CM3;CM4
)

test_append_boost_config_macros(
[=[

#define CM1 1

#define CM2 1

#define CM3

#define CM4

#define CM5
]=]
CONFIG_MACRO_CM1=1 IGNORED1=1 IGNORED2=2 CONFIG_MACRO_CM2=1
CONFIG_MACRO=CM3;CM4 CM5 IGNORED3=3 IGNORED4
)

test_append_boost_config_macros(
[=[

#define CM1 "with spaces"

#define CM2 2

#define CM3

#define CM4
]=]
"CONFIG_MACRO_CM1=\"with spaces\""
CONFIG_MACRO_CM2=2 CONFIG_MACRO=CM3;CM4
)

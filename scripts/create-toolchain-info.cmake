cmake_minimum_required(VERSION 3.0)
project(HunterToolchain)

if(NOT HUNTER_SELF)
  # Emulate 'hunter_internal_error'
  message("[hunter ** INTERNAL **] HUNTER_SELF is empty")
  message("[hunter ** INTERNAL **] [Directory:${CMAKE_CURRENT_LIST_DIR}]")
  message("")
  message("------------------------------ ERROR ------------------------------")
  message("    https://docs.hunter.sh/en/latest/reference/errors/error.internal.html")
  message("-------------------------------------------------------------------")
  message(FATAL_ERROR "")
endif()

list(APPEND CMAKE_MODULE_PATH "${HUNTER_SELF}/cmake/modules")
include(hunter_fatal_error)
include(hunter_internal_error)

if(NOT TOOLCHAIN_INFO_FILE)
  hunter_internal_error("TOOLCHAIN_INFO_FILE is empty")
endif()

if(NOT CMAKE_BINARY_DIR)
  hunter_internal_error("CMAKE_BINARY_DIR empty")
endif()

if(EXISTS "${TOOLCHAIN_INFO_FILE}")
  hunter_internal_error("${TOOLCHAIN_INFO_FILE} already exists")
endif()

include(hunter_assert_not_empty_string)
hunter_assert_not_empty_string("${HUNTER_CONFIGURATION_TYPES}")

file(
    WRITE
    "${TOOLCHAIN_INFO_FILE}"
    "Cache version: 6\n"
    "Polly toolchains:\n"
    "    IPHONEOS_ARCHS: ${IPHONEOS_ARCHS}\n"
    "    IPHONESIMULATOR_ARCHS: ${IPHONESIMULATOR_ARCHS}\n"
    "Other:\n"
    "    CMAKE_GENERATOR: ${CMAKE_GENERATOR}\n"
    "    HUNTER_CONFIGURATION_TYPES: ${HUNTER_CONFIGURATION_TYPES}\n"
    "    HUNTER_TOOLCHAIN_UNDETECTABLE_ID: ${HUNTER_TOOLCHAIN_UNDETECTABLE_ID}\n"
)

string(COMPARE EQUAL "${HUNTER_BUILD_SHARED_LIBS}" "" is_empty)
if(NOT is_empty)
  file(
      APPEND
      "${TOOLCHAIN_INFO_FILE}"
      "    HUNTER_BUILD_SHARED_LIBS: ${HUNTER_BUILD_SHARED_LIBS}\n"
  )
endif()

string(COMPARE EQUAL "${OSX_SDK_VERSION}" "" is_empty)
if(NOT is_empty)
  file(
      APPEND
      "${TOOLCHAIN_INFO_FILE}"
      "    OSX_SDK_VERSION: ${OSX_SDK_VERSION}\n"
  )
endif()

foreach(configuration ${HUNTER_CONFIGURATION_TYPES})
  string(TOUPPER "${configuration}" configuration_upper)
  file(APPEND "${TOOLCHAIN_INFO_FILE}" "    CMAKE_${configuration_upper}_POSTFIX: ")
  file(APPEND "${TOOLCHAIN_INFO_FILE}" "${CMAKE_${configuration_upper}_POSTFIX}\n")
endforeach()

set(predefined "${HUNTER_SELF}/scripts/ShowPredefined.cpp")
if(NOT EXISTS "${predefined}")
  hunter_internal_error("${predefined} not exists")
endif()

try_compile(
    try_compile_result
    "${CMAKE_BINARY_DIR}/_test"
    "${predefined}"
    CMAKE_FLAGS "-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}"
    OUTPUT_VARIABLE outresult
)

if(NOT try_compile_result)
  hunter_internal_error(
      "Compilation of ${predefined} failed. Result: ${try_compile_result}\n"
      "Output:\n--- OUTPUT BEGIN ---\n${outresult}\n--- OUTPUT END ---"
  )
endif()

function(split_string string_in result)
  set("${result}" "")

  while(TRUE)
    string(COMPARE EQUAL "${string_in}" "" is_empty)
    if(is_empty)
      break()
    endif()

    string(FIND "${string_in}" "\n" eol_pos)
    if(eol_pos EQUAL -1)
      list(APPEND "${result}" "${string_in}")
      break()
    endif()

    string(SUBSTRING "${string_in}" 0 ${eol_pos} substring)
    list(APPEND "${result}" "${substring}")
    math(EXPR eol_pos "${eol_pos} + 1") # Skip EOL character
    string(SUBSTRING "${string_in}" ${eol_pos} -1 string_in)
  endwhile()

  set(${result} "${${result}}" PARENT_SCOPE)
endfunction()

split_string("${outresult}" list_of_strings)

set(macros_list "")
foreach(x ${list_of_strings})
  string(
      REGEX
      MATCH
      "__HUNTER_MACRO_CHECK_BEGIN__.*__HUNTER_MACRO_CHECK_END__"
      result_x
      "${x}"
  )
  if(result_x)
    string(
        REGEX
        REPLACE
        ".*__HUNTER_MACRO_CHECK_BEGIN__\(.*\)__HUNTER_MACRO_CHECK_END__.*"
        "\\1"
        result_x
        "${x}"
    )

    string(FIND "${result_x}" ";" semicolon_pos)
    if(NOT semicolon_pos EQUAL "-1")
      hunter_internal_error("Semicolon in string: '${result_x}'")
    endif()

    list(APPEND macros_list "${result_x}")
  endif()
endforeach()

list(REMOVE_DUPLICATES macros_list)
string(REPLACE ";" "\n" macros_string "${macros_list}")

string(COMPARE EQUAL "${macros_string}" "" is_empty)
if(is_empty)
  hunter_fatal_error("No toolchain info generated" ERROR_PAGE error.no.toolchain.info)
endif()

file(APPEND "${TOOLCHAIN_INFO_FILE}" "Predefined macroses:\n${macros_string}")

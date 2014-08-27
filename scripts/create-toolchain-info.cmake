cmake_minimum_required(VERSION 3.0)

if(NOT TOOLCHAIN_INFO_FILE)
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "TOOLCHAIN_INFO_FILE is empty "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
  )
endif()

if(NOT CMAKE_BINARY_DIR)
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "CMAKE_BINARY_DIR empty "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
  )
endif()

if(NOT HUNTER_SELF)
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "HUNTER_SELF empty "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
  )
endif()

if(EXISTS "${TOOLCHAIN_INFO_FILE}")
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "${TOOLCHAIN_INFO_FILE} already exists "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
  )
endif()

file(
    WRITE
    "${TOOLCHAIN_INFO_FILE}"
    "Some hunter variables:\n"
    "    HUNTER_ENABLE_BOOST_SHARED: ${HUNTER_ENABLE_BOOST_SHARED}\n"
    "    HUNTER_CMAKE_GENERATOR: ${HUNTER_CMAKE_GENERATOR}\n"
    "Polly toolchains:\n"
    "    IPHONEOS_ARCHS: ${IPHONEOS_ARCHS}\n"
    "    IPHONESIMULATOR_ARCHS: ${IPHONESIMULATOR_ARCHS}\n"
    "Other:\n"
    "    CMAKE_GENERATOR: ${CMAKE_GENERATOR}\n"
)

set(predefined "${HUNTER_SELF}/scripts/ShowPredefined.cpp")
if(NOT EXISTS "${predefined}")
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "${predefined} not exists "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
  )
endif()

try_compile(
    try_compile_result
    "${CMAKE_BINARY_DIR}/_test"
    "${predefined}"
    CMAKE_FLAGS "-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}"
    OUTPUT_VARIABLE outresult
)

if(NOT try_compile_result)
  message(
      FATAL_ERROR
      "[hunter ** INTERNAL **] "
      "Compilation of ${predefined} failed "
      "(https://github.com/ruslo/hunter/wiki/Error-%28Internal%29)"
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

set(macroses "")
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
    set(macroses "${macroses}${result_x}\n")
  endif()
endforeach()

file(APPEND "${TOOLCHAIN_INFO_FILE}" "Predefined macroses:\n${macroses}")

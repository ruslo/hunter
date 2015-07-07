# ----------------------------------------------------------------------
# Findodb-compiler.cmake - odb compiler function
#
# Copyright (c) 2014 Timo Rothenpieler <btbn@btbn.de>, Per Edin <info@peredin.com>
# Copyright (c) 2015 Alexandre Pretyman <alexandre.pretyman@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the
# following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Instructions:
#
# odb_compile command takes a target as first argument, so *AFTER* either:
#   add_executable("target" ...)
#   add_library("target" ...)
#
# odb_compile just forwards options to the command line of the compiler,
# more information: http://www.codesynthesis.com/products/odb/doc/odb.xhtml
#
# the call options are:
#   odb_compile("target"
#       FILES                     # header files to be parsed *REQUIRED*
#         persistent_object1.hxx
#         persistent_object2.hxx
#       DB                        # --database *REQUIRED*
#         sqlite
#       INCLUDE                   # -I dir
#         /usr/include/dir
#         /home/example/include
#       GENERATE_QUERY            # --generate-query
#       GENERATE_SESSION          # --generate-session
#       GENERATE_SCHEMA           # --generate-schema
#       SCHEMA_FORMAT             # --schema-format
#         embedded
#       SCHEMA_NAME               # --schema-name
#         schema_name
#       TABLE_PREFIX              # --table-prefix
#         prefix
#       STANDARD                  # --std
#         c++11
#       SLOC_LIMIT                # --sloc-limit
#         99999
#       ODB_PROLOGUE              # --odb-prologue
#         "\#include \"this\""
#       HEADER_PROLOGUE           # --hxx-prologue
#         "header prologue"
#       INLINE_PROLOGUE           # --ixx-prologue
#         "inline prologue"
#       SOURCE_PROLOGUE           # --cxx-prologue
#         "source prologue"
#       ODB_EPILOGUE              # --odb-epilogue
#         "odb epilogue"
#       HEADER_EPILOGUE           # --hxx-epilogue
#         "header epilogue"
#       INLINE_EPILOGUE           # --ixx-epilogue
#         "inline epilogue"
#       SOURCE_EPILOGUE           # --cxx-epilogue
#         "header epilogue"
#       ODB_PROLOGUE-FILE         # --odb-prologue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       HEADER_PROLOGUE-FILE      # --hxx-prologue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       INLINE_PROLOGUE-FILE      # --ixx-prologue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       SOURCE_PROLOGUE-FILE      # --cxx-prologue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       ODB_EPILOGUE-FILE         # --odb-epilogue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       HEADER_EPILOGUE-FILE      # --hxx-epilogue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       INLINE_EPILOGUE-FILE      # --ixx-epilogue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#       SOURCE_EPILOGUE-FILE      # --cxx-epilogue-file
#         ${CMAKE_SOURCE_DIR}/file.ext
#    )
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("ODB-COMPILER_ROOT: ${ODB-COMPILER_ROOT}")

find_program(
    ODB_COMPILER
      odb
    DOC
      "odb compiler"
    PATHS
      "${ODB-COMPILER_ROOT}/bin"
)

hunter_status_debug("ODB_COMPILER: ${ODB_COMPILER}")

if(NOT ODB_COMPILER)
  if (odb-compiler_FIND_REQUIRED)
    message(FATAL_ERROR "odb compiler executable not found")
  endif()
endif()

function(odb_compile _target)
  if(NOT ODB_COMPILER)
    message(FATAL_ERROR "odb compiler executable not found")
  endif()
  if(NOT TARGET ${_target})
    message(FATAL_ERROR "odb_compile called on target: ${_target} - but target hasn't yet been created")
  endif()

  set(optional GENERATE_QUERY GENERATE_SESSION GENERATE_SCHEMA GENERATE_PREPARED)
  set(oneValueParams SCHEMA_FORMAT SCHEMA_NAME TABLE_PREFIX
    STANDARD SLOC_LIMIT
    ODB_PROLOGUE HEADER_PROLOGUE INLINE_PROLOGUE SOURCE_PROLOGUE
    ODB_EPILOGUE HEADER_EPILOGUE INLINE_EPILOGUE SOURCE_EPILOGUE
    ODB_PROLOGUE-FILE HEADER_PROLOGUE-FILE INLINE_PROLOGUE-FILE SOURCE_PROLOGUE-FILE
    ODB_EPILOGUE-FILE HEADER_EPILOGUE-FILE INLINE_EPILOGUE-FILE SOURCE_EPILOGUE-FILE
    MULTI_DATABASE
    PROFILE)
  set(multiValueParams FILES INCLUDE DB)

  cmake_parse_arguments(PARAM "${optional}" "${oneValueParams}" "${multiValueParams}" ${ARGN})

  if(PARAM_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "invalid arguments passed to odb_compile: ${PARAM_UNPARSED_ARGUMENTS}")
  endif()

  if(NOT PARAM_FILES)
    message(FATAL_ERROR: "odb_compile called without FILES to compile")
  endif()

  if(NOT PARAM_DB)
    message(FATAL_ERROR: "odb_compile called without a DB")
  endif()

  string(COMPARE EQUAL "${ODB_COMPILE_OUTPUT_DIR}" "" output_dir_is_empty)
  if (output_dir_is_empty)
    set(ODB_COMPILE_OUTPUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/generated-odb")
  endif()

  #AWP: these are the odb compiler defaults
  string(COMPARE EQUAL "${ODB_COMPILE_HEADER_SUFFIX}" "" header_suffix_is_empty)
  if(header_suffix_is_empty)
    set(ODB_COMPILE_HEADER_SUFFIX ".hxx")
  endif()
  string(COMPARE EQUAL "${ODB_COMPILE_INLINE_SUFFIX}" "" inline_suffix_is_empty)
  if(inline_suffix_is_empty)
    set(ODB_COMPILE_INLINE_SUFFIX ".ixx")
  endif()
  string(COMPARE EQUAL "${ODB_COMPILE_SOURCE_SUFFIX}" "" source_suffix_is_empty)
  if(source_suffix_is_empty)
    set(ODB_COMPILE_SOURCE_SUFFIX ".cxx")
  endif()
  string(COMPARE EQUAL "${ODB_COMPILE_FILE_SUFFIX}" "" compile_file_suffix_is_empty)
  if(compile_file_suffix_is_empty)
    set(ODB_COMPILE_FILE_SUFFIX "-odb")
  endif()

  set(ODB_ARGS)

  if(PARAM_MULTI_DATABASE)
    list(APPEND ODB_ARGS --multi-database "${PARAM_MULTI_DATABASE}")
    list(APPEND PARAM_DB common)
  endif()

  foreach(db ${PARAM_DB})
    list(APPEND ODB_ARGS -d "${db}")
  endforeach()

  if(PARAM_GENERATE_QUERY)
    list(APPEND ODB_ARGS --generate-query)
  endif()

  if(PARAM_GENERATE_SESSION)
    list(APPEND ODB_ARGS --generate-session)
  endif()

  if(PARAM_GENERATE_SCHEMA)
    list(APPEND ODB_ARGS --generate-schema)
  endif()

  if(PARAM_GENERATE_PREPARED)
    list(APPEND ODB_ARGS --generate-prepared)
  endif()

  if(PARAM_SCHEMA_FORMAT)
    list(APPEND ODB_ARGS --schema-format "${PARAM_SCHEMA_FORMAT}")
  endif()

  if(PARAM_SCHEMA_NAME)
    list(APPEND ODB_ARGS --schema-name "${PARAM_SCHEMA_NAME}")
  endif()

  if(PARAM_TABLE_PREFIX)
    list(APPEND ODB_ARGS --table-prefix "${PARAM_TABLE_PREFIX}")
  endif()

  if(PARAM_STANDARD)
    list(APPEND ODB_ARGS --std "${PARAM_STANDARD}")
  endif()

  if(PARAM_SLOC_LIMIT)
    list(APPEND ODB_ARGS --sloc-limit "${PARAM_SLOC_LIMIT}")
  endif()

  #AWP: prolog and epilog without the file
  if(PARAM_ODB_PROLOGUE)
    list(APPEND ODB_ARGS --odb-prologue "${PARAM_ODB_PROLOGUE}")
  endif()

  if(PARAM_HEADER_PROLOGUE)
    list(APPEND ODB_ARGS --hxx-prologue "${PARAM_HEADER_PROLOGUE}")
  endif()

  if(PARAM_INLINE_PROLOGUE)
    list(APPEND ODB_ARGS --ixx-prologue "${PARAM_INLINE_PROLOGUE}")
  endif()

  if(PARAM_SOURCE_PROLOGUE)
    list(APPEND ODB_ARGS --cxx-prologue "${PARAM_SOURCE_PROLOGUE}")
  endif()

  if(PARAM_ODB_EPILOGUE)
    list(APPEND ODB_ARGS --odb-epilogue "${PARAM_ODB_EPILOGUE}")
  endif()

  if(PARAM_HEADER_EPILOGUE)
    list(APPEND ODB_ARGS --hxx-epilogue "${PARAM_HEADER_EPILOGUE}")
  endif()

  if(PARAM_INLINE_EPILOGUE)
    list(APPEND ODB_ARGS --ixx-epilogue "${PARAM_INLINE_EPILOGUE}")
  endif()

  if(PARAM_SOURCE_EPILOGUE)
    list(APPEND ODB_ARGS --cxx-epilogue "${PARAM_SOURCE_EPILOGUE}")
  endif()

  #AWP: prolog and epilogue from existing files
  if(PARAM_ODB_PROLOGUE-FILE)
    list(APPEND ODB_ARGS --odb-prologue-file "${PARAM_ODB_PROLOGUE-FILE}")
  endif()

  if(PARAM_HEADER_PROLOGUE-FILE)
    list(APPEND ODB_ARGS --hxx-prologue-file "${PARAM_HEADER_PROLOGUE-FILE}")
  endif()

  if(PARAM_INLINE_PROLOGUE-FILE)
    list(APPEND ODB_ARGS --ixx-prologue-file "${PARAM_INLINE_PROLOGUE-FILE}")
  endif()

  if(PARAM_SOURCE_PROLOGUE-FILE)
    list(APPEND ODB_ARGS --cxx-prologue-file "${PARAM_SOURCE_PROLOGUE-FILE}")
  endif()

  if(PARAM_ODB_EPILOGUE-FILE)
    list(APPEND ODB_ARGS --odb-epilogue-file "${PARAM_ODB_EPILOGUE-FILE}")
  endif()

  if(PARAM_HEADER_EPILOGUE-FILE)
    list(APPEND ODB_ARGS --hxx-epilogue-file "${PARAM_HEADER_EPILOGUE-FILE}")
  endif()

  if(PARAM_INLINE_EPILOGUE-FILE)
    list(APPEND ODB_ARGS --ixx-epilogue-file "${PARAM_INLINE_EPILOGUE-FILE}")
  endif()

  if(PARAM_SOURCE_EPILOGUE-FILE)
    list(APPEND ODB_ARGS --cxx-epilogue-file "${PARAM_SOURCE_EPILOGUE-FILE}")
  endif()

  if(PARAM_PROFILE)
    list(APPEND ODB_ARGS --profile "${PARAM_PROFILE}")
  endif()

  list(APPEND ODB_ARGS --output-dir "${ODB_COMPILE_OUTPUT_DIR}")
  list(APPEND ODB_ARGS --hxx-suffix "${ODB_COMPILE_HEADER_SUFFIX}")
  list(APPEND ODB_ARGS --ixx-suffix "${ODB_COMPILE_INLINE_SUFFIX}")
  list(APPEND ODB_ARGS --cxx-suffix "${ODB_COMPILE_SOURCE_SUFFIX}")

  if(PARAM_MULTI_DATABASE AND NOT "${ODB_COMPILE_FILE_SUFFIX}" MATCHES ".+:.+")
    set(osuffix "${ODB_COMPILE_FILE_SUFFIX}")
    set(ODB_COMPILE_FILE_SUFFIX)
    foreach(db ${PARAM_DB})
      if("${db}" MATCHES "common")
        list(APPEND ODB_COMPILE_FILE_SUFFIX "${db}:${osuffix}")
      else()
        list(APPEND ODB_COMPILE_FILE_SUFFIX "${db}:${osuffix}_${db}")
      endif()
    endforeach()
  endif()

  foreach(sfx ${ODB_COMPILE_FILE_SUFFIX})
    list(APPEND ODB_ARGS --odb-file-suffix "${sfx}")
  endforeach()

  foreach(dir ${PARAM_INCLUDE} ${ODB_INCLUDE_DIRS})
    list(APPEND ODB_ARGS "-I${dir}")
  endforeach()

  file(REMOVE_RECURSE "${ODB_COMPILE_OUTPUT_DIR}")
  file(MAKE_DIRECTORY "${ODB_COMPILE_OUTPUT_DIR}")

  #AWP: TODO: add contents of *-file param as dependencies of custom_command
  set(generated_source_files)
  foreach(input ${PARAM_FILES})
    get_filename_component(fname "${input}" NAME_WE)
    set(outputs)

    foreach(sfx ${ODB_COMPILE_FILE_SUFFIX})
      string(REGEX REPLACE ":.*$" "" pfx "${sfx}")
      string(REGEX REPLACE "^.*:" "" sfx "${sfx}")

      if(NOT "${PARAM_MULTI_DATABASE}" MATCHES "static" OR NOT "${pfx}" MATCHES "common")
        set(output "${ODB_COMPILE_OUTPUT_DIR}/${fname}${sfx}${ODB_COMPILE_SOURCE_SUFFIX}")
        list(APPEND outputs "${output}")
        list(APPEND generated_source_files "${output}")
      endif()
    endforeach()

    if(HUNTER_STATUS_DEBUG)
      set(_msg "${ODB_COMPILER} ${ODB_ARGS} ${input}")
      string(REPLACE ";" " " _msg "${_msg}")
      hunter_status_debug("ODB_COMPILE_OPTIONS: ${_msg}")
    endif()

    add_custom_command(OUTPUT ${outputs}
      COMMAND ${ODB_COMPILER} ${ODB_ARGS} "${input}"
      DEPENDS "${input}"
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
      VERBATIM
    )
  endforeach()

  #AWP: update target sources
  get_target_property(_target_sources ${_target} SOURCES)
  list(APPEND _target_sources ${generated_source_files})
  set_target_properties(${_target}
      PROPERTIES
        SOURCES "${_target_sources}"
  )
  target_include_directories(${_target}
      PUBLIC
        ${ODB_COMPILE_OUTPUT_DIR}
        ${ODB_INCLUDE_DIRS}
  )
endfunction()

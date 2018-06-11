include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)
include(hunter_get_git_executable)
include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_pack_git_self)
  hunter_assert_not_empty_string("${HUNTER_GATE_LOCATION}")

  set(optional "")
  set(one PACKAGE URL_OUT SHA1_OUT)
  set(multiple "")

  # Introduce:
  # * x_PACKAGE
  # * x_URL_OUT
  # * x_SHA1_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_URL_OUT}")
  hunter_assert_not_empty_string("${x_SHA1_OUT}")

  hunter_get_git_executable(git_executable)

  set(cmd "${git_executable}" rev-parse --show-toplevel)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(top_git_directory "${output}")

  if(NOT EXISTS "${top_git_directory}")
    hunter_internal_error("Directory not found: ${top_git_directory}")
  endif()

  if(NOT IS_DIRECTORY "${top_git_directory}")
    hunter_internal_error("Not a directory: ${top_git_directory}")
  endif()

  set(cmd "${git_executable}" status --porcelain)
  hunter_status_debug(
      "Run command '${cmd}' in '${top_git_directory}' directory"
  )
  hunter_status_debug(
      "All changes in '${HUNTER_GATE_LOCATION}' directory will be ignored"
  )
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  # https://git-scm.com/docs/git-status#_short_format
  string(REPLACE "\n" ";" output "${output}")
  foreach(status_full_line ${output})
    # status_full_line can be:
    # * 'XY PATH'
    # * 'XY ORIG_PATH -> PATH'
    string(REGEX REPLACE "^.. " "" no_status_line "${status_full_line}")
    string(COMPARE EQUAL "${no_status_line}" "${status_full_line}" no_change)
    if(no_change)
      hunter_internal_error("Unexpected status format: '${status_full_line}'")
    endif()

    # no_status_line can be:
    # * 'PATH'
    # * 'ORIG_PATH -> PATH'
    string(REGEX REPLACE " -> " ";" status_files "${no_status_line}")

    # status_files can be:
    # * 'PATH'
    # * 'ORIG_PATH;PATH'

    # Check that dirty files are part of directory with HunterGate
    foreach(status_file ${status_files})
      set(path_to_check "${top_git_directory}/${status_file}")

      string(LENGTH "${path_to_check}" path_to_check_len)
      string(LENGTH "${HUNTER_GATE_LOCATION}" hunter_gate_location_len)

      if(hunter_gate_location_len EQUAL path_to_check_len)
        # HUNTER_GATE_LOCATION is a directory, path_to_check is a file,
        # if they have same size then path_to_check is not in
        # HUNTER_GATE_LOCATION directory for sure
        hunter_user_error(
            "Git directory is dirty: '${path_to_check}'"
            "Please commit or stash changes."
        )
      endif()

      if(hunter_gate_location_len GREATER path_to_check_len)
        hunter_user_error(
            "Git directory is dirty: '${path_to_check}'"
            "Please commit or stash changes."
        )
      endif()

      string(
          SUBSTRING
          "${path_to_check}"
          0
          ${hunter_gate_location_len}
          path_to_check_begin
      )

      math(
          EXPR
          path_to_check_end_len
          "${path_to_check_len} - ${hunter_gate_location_len}"
      )

      string(
          SUBSTRING
          "${path_to_check}"
          ${hunter_gate_location_len}
          ${path_to_check_end_len}
          path_to_check_end
      )

      string(
          COMPARE
          EQUAL
          "${path_to_check}"
          "${path_to_check_begin}${path_to_check_end}"
          is_ok
      )
      if(NOT is_ok)
        hunter_internal_error("Split failed")
      endif()

      string(
          COMPARE
          EQUAL
          "${path_to_check_begin}"
          "${HUNTER_GATE_LOCATION}"
          is_same
      )

      if(NOT is_same)
        hunter_user_error(
            "Git directory is dirty: '${path_to_check}'"
            "Please commit or stash changes."
        )
      endif()

      get_filename_component(
          full_path_1
          "${HUNTER_GATE_LOCATION}/${path_to_check_end}"
          ABSOLUTE
      )

      get_filename_component(
          full_path_2
          "${path_to_check}"
          ABSOLUTE
      )

      string(COMPARE EQUAL "${full_path_1}" "${full_path_2}" is_same)
      if(is_same)
        hunter_status_debug("Change ignored: '${path_to_check}'")
      else()
        hunter_user_error(
            "Git directory is dirty: '${path_to_check}'"
            "Please commit or stash changes."
        )
      endif()
    endforeach()
  endforeach()

  set(cmd "${git_executable}" rev-parse --git-path HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(head_file "${output}")
  if(NOT IS_ABSOLUTE "${head_file}")
    set(head_file ${top_git_directory}/${head_file})
  endif()

  if(NOT EXISTS "${head_file}")
    hunter_internal_error("File not found: '${head_file}'")
  endif()
  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${head_file}"
  )

  set(cmd "${git_executable}" rev-parse --symbolic-full-name HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(head_ref "${output}")
  set(cmd "${git_executable}" rev-parse --git-path "${head_ref}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(ref_file "${output}")
  if(NOT IS_ABSOLUTE "${ref_file}")
    set(ref_file "${top_git_directory}/${ref_file}")
  endif()
  if(NOT EXISTS "${ref_file}")
    hunter_internal_error("File not fond: ${ref_file}")
  endif()

  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${ref_file}"
  )

  set(
      archives_directory
      "${CMAKE_CURRENT_BINARY_DIR}/_3rdParty/Hunter/git-archives"
  )
  file(MAKE_DIRECTORY "${archives_directory}")

  set(archive "${archives_directory}/${x_PACKAGE}.tar")
  hunter_status_debug("Creating archive '${archive}'")

  set(cmd "${git_executable}" archive HEAD -o "${archive}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  file(SHA1 "${archive}" package_sha1)
  set(package_url "file://${archive}")

  set("${x_URL_OUT}" "${package_url}" PARENT_SCOPE)
  set("${x_SHA1_OUT}" "${package_sha1}" PARENT_SCOPE)
endfunction()

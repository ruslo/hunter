include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)
include(hunter_internal_error)
include(hunter_status_debug)

set(_HUNTER_TEMPLATE_SCHEME_DIR "${CMAKE_CURRENT_LIST_DIR}/../templates")

function(hunter_pack_git_self)
  hunter_assert_not_empty_string("${HUNTER_GATE_LOCATION}")

  set(PACKAGE_NAME "${_hunter_current_project}")
  string(COMPARE EQUAL "${PACKAGE_NAME}" "" is_empty)
  if(is_empty)
    hunter_internal_error("_hunter_current_project is empty")
  endif()

  set(optional "")
  set(one VERSION)
  set(multiple "")

  # Introduce:
  # * x_VERSION
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_VERSION}" "" is_empty)
  if(is_empty)
    hunter_internal_error("VERSION is empty")
  endif()

  string(COMPARE EQUAL "$ENV{HUNTER_GIT_EXECUTABLE}" "" is_empty)

  if(is_empty)
    find_package(Git REQUIRED)
  else()
    set(GIT_EXECUTABLE "$ENV{HUNTER_GIT_EXECUTABLE}")
    execute_process(
        COMMAND
        ${GIT_EXECUTABLE} --version
        RESULT_VARIABLE result
        OUTPUT_VARIABLE output
        ERROR_VARIABLE output
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_STRIP_TRAILING_WHITESPACE
    )
    if(result EQUAL "0")
      if(output MATCHES "^git version [0-9]")
        string(REPLACE "git version " "" GIT_VERSION_STRING "${output}")
      else()
        hunter_internal_error("Unexpected output: ${output}")
      endif()
    else()
      hunter_internal_error("Can't get Git version: ${result} ${output}")
    endif()
  endif()
  hunter_status_debug("Using git executable: ${GIT_EXECUTABLE}")

  # For '--git-path':
  # * https://git-scm.com/docs/git-rev-parse/2.5.0
  if(GIT_VERSION_STRING VERSION_LESS "2.5.0")
    hunter_user_error("At least Git 2.5.0 required")
  endif()

  set(cmd "${GIT_EXECUTABLE}" rev-parse --show-toplevel)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
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

  set(cmd "${GIT_EXECUTABLE}" status --porcelain)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
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

  set(cmd "${GIT_EXECUTABLE}" rev-parse --git-path HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
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

  set(cmd "${GIT_EXECUTABLE}" rev-parse --symbolic-full-name HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(head_ref "${output}")
  set(cmd "${GIT_EXECUTABLE}" rev-parse --git-path "${head_ref}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
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

  set(archives_directory "${CMAKE_CURRENT_BINARY_DIR}/_3rdParty/Hunter/git-archives")
  file(MAKE_DIRECTORY "${archives_directory}")

  set(archive "${archives_directory}/${PACKAGE_NAME}.tar")
  hunter_status_debug("Creating archive '${archive}'")

  set(cmd "${GIT_EXECUTABLE}" archive HEAD -o "${archive}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${top_git_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(version_file "${archives_directory}/${PACKAGE_NAME}-version.cmake")
  set(download_file "${archives_directory}/${PACKAGE_NAME}-download.cmake")

  file(SHA1 "${archive}" PACKAGE_SHA1)
  set(PACKAGE_URL "file://${archive}")

  # Use:
  # * PACKAGE_NAME
  configure_file(
      "${_HUNTER_TEMPLATE_SCHEME_DIR}/package-download.cmake.in"
      "${download_file}"
      @ONLY
  )

  # Use:
  # * PACKAGE_NAME
  # * PACKAGE_SHA1
  # * PACKAGE_URL
  configure_file(
      "${_HUNTER_TEMPLATE_SCHEME_DIR}/package-version.cmake.in"
      "${version_file}"
      @ONLY
  )

  # Note: SUBMODULE is not relevant in property name, just use same facility
  set_property(
      GLOBAL
      PROPERTY
      "HUNTER_${PACKAGE_NAME}_GIT_SUBMODULE_DIR"
      "${archives_directory}"
  )

  set_property(
      GLOBAL
      APPEND
      PROPERTY
      HUNTER_SUBMODULE_PROJECTS
      "${PACKAGE_NAME}"
  )

  set("${x_VERSION}" "${PACKAGE_SHA1}" PARENT_SCOPE)
endfunction()

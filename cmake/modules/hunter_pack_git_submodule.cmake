include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)

set(_HUNTER_TEMPLATE_SCHEME_DIR "${CMAKE_CURRENT_LIST_DIR}/../templates")

function(hunter_pack_git_submodule)
  set(PACKAGE_NAME "${_hunter_current_project}")
  string(COMPARE EQUAL "${PACKAGE_NAME}" "" is_empty)
  if(is_empty)
    hunter_internal_error("_hunter_current_project is empty")
  endif()

  set(optional "")
  set(one GIT_SUBMODULE PROJECT_FILE VERSION SUBMODULE_SOURCE_SUBDIR)
  set(multiple "")

  # Introduce:
  # * x_GIT_SUBMODULE
  # * x_PROJECT_FILE
  # * x_VERSION
  # * x_SUBMODULE_SOURCE_SUBDIR
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_GIT_SUBMODULE}" "" is_empty)
  if(is_empty)
    hunter_internal_error("GIT_SUBMODULE is empty")
  endif()

  find_package(Git REQUIRED)
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

  set(cmd "${GIT_EXECUTABLE}" submodule status "${x_GIT_SUBMODULE}")
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
    string(REPLACE ";" " " cmd "${cmd}")
    hunter_internal_error(
        "Command failed: '${cmd}' (${result}, ${output}, ${error})"
        "To reproduce error go to '${top_git_directory}' and"
        "run command '${cmd}'"
    )
  endif()

  set(submodule_file "${top_git_directory}/.gitmodules")
  if(NOT EXISTS "${submodule_file}")
    hunter_internal_error("File not found: '${submodule_file}'")
  endif()
  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${submodule_file}"
  )

  set(submodule_dir "${top_git_directory}/${x_GIT_SUBMODULE}")
  if(NOT EXISTS "${submodule_dir}")
    hunter_internal_error("Directory not exist: '${submodule_dir}'")
  endif()

  set(cmd "${GIT_EXECUTABLE}" status --porcelain)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_dir}"
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

  string(COMPARE EQUAL "${output}" "" is_empty)
  if(NOT is_empty)
    hunter_user_error(
        "Git directory '${submodule_dir}' is dirty."
        "Please commit or stash changes."
    )
  endif()

  set(cmd "${GIT_EXECUTABLE}" rev-parse --git-path HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_dir}"
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
  if(NOT EXISTS "${head_file}")
    hunter_internal_error("File not found: '${head_file}'")
  endif()
  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${head_file}"
  )

  set(cmd "${GIT_EXECUTABLE}" rev-parse --symbolic-full-name HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_dir}"
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
      WORKING_DIRECTORY "${submodule_dir}"
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

  # check if whole submodule or just a subfolder is to be archived
  string(COMPARE EQUAL "${x_SUBMODULE_SOURCE_SUBDIR}" "" is_empty)
  if(is_empty)
    hunter_status_debug("No SUBMODULE_SOURCE_SUBDIR specified, archive whole submodule")
    set(source_flag)
  else()
    hunter_status_debug("SUBMODULE_SOURCE_SUBDIR specified, only archive subfolder: ${x_SUBMODULE_SOURCE_SUBDIR}")
    set(source_flag "/${x_SUBMODULE_SOURCE_SUBDIR}")
  endif()

  set(cmd "${GIT_EXECUTABLE}" archive HEAD -o "${archive}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_dir}${source_flag}"
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

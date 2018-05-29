# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_internal_error)
include(hunter_user_error)

function(hunter_get_git_executable git_executable_varname)
  hunter_assert_not_empty_string("${git_executable_varname}")
  hunter_assert_empty_string("${ARGN}")

  if("$ENV{HUNTER_GIT_EXECUTABLE}" STREQUAL "")
    find_package(Git REQUIRED)
    set(git_executable ${GIT_EXECUTABLE})
    set(git_version ${GIT_VERSION_STRING})
  else()
    set(git_executable "$ENV{HUNTER_GIT_EXECUTABLE}")
    execute_process(
        COMMAND
        ${git_executable} --version
        RESULT_VARIABLE result
        OUTPUT_VARIABLE output
        ERROR_VARIABLE output
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_STRIP_TRAILING_WHITESPACE
    )
    if(result EQUAL "0")
      if(output MATCHES "^git version [0-9]")
        string(REPLACE "git version " "" git_version "${output}")
      else()
        hunter_internal_error("Unexpected output: ${output}")
      endif()
    else()
      hunter_internal_error("Can't get Git version: ${result} ${output}")
    endif()
  endif()

  hunter_status_debug("Using git executable: ${git_executable}")

  hunter_assert_not_empty_string("${git_version}")

  # For '--git-path':
  # * https://git-scm.com/docs/git-rev-parse/2.5.0
  if(git_version VERSION_LESS "2.5.0")
    hunter_user_error("At least Git 2.5.0 required")
  endif()

  set("${git_executable_varname}" "${git_executable}" PARENT_SCOPE)
endfunction()

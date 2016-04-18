include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_internal_error)
include(hunter_test_string_not_empty)
include(hunter_status_debug)
include(hunter_status_print)
include(hunter_install_repository)

function(hunter_add_repository)
  if(PROJECT_NAME OR NOT HUNTER_GATE_ROOT)
    hunter_internal_error(
        "hunter_add_repository must be called *after* HunterGate"
        "and *before* project(...)"
    )
  endif()
  cmake_parse_arguments(har "" "URL;SHA1" "" "${ARGV}")
  hunter_test_string_not_empty("${har_URL}")
  hunter_test_string_not_empty("${har_SHA1}")

  # set root for all repositories (except builtin)
  if(NOT HUNTER_REPOSITORY_ROOT)
    set(HUNTER_REPOSITORY_ROOT "${HUNTER_GATE_ROOT}/_Base/repositories")
    set(HUNTER_REPOSITORY_ROOT "${HUNTER_REPOSITORY_ROOT}" PARENT_SCOPE)
  endif()

  set(rootdir "${HUNTER_REPOSITORY_ROOT}/${har_SHA1}")
  if(NOT EXISTS "${rootdir}/Done")
    hunter_install_repository("${rootdir}" "${har_URL}" "${har_SHA1}")
  endif()
  # check install went ok
  file(READ "${rootdir}/Done" actual_sha1)
  string(STRIP "${actual_sha1}" actual_sha1)
  if(NOT "${har_SHA1}" STREQUAL "${actual_sha1}")
    hunter_internal_error(
        "SHA1 of repo does not match ${har_SHA1} vs ${actual_sha1}"
    )
  endif()

  include("${rootdir}/Unpacked/init.cmake")
  if(NOT HUNTER_CURRENT_REPOSITORY_NAME)
    hunter_internal_error(
        "Repository (${url}) did not call hunter_init_repository"
    )
  endif()
  if(NOT HUNTER_CURRENT_REPOSITORY_VERSION)
    hunter_internal_error(
        "Repository (${url}) did not call hunter_init_repository"
    )
  endif()

  set(reponame
      "${HUNTER_CURRENT_REPOSITORY_NAME}-${HUNTER_CURRENT_REPOSITORY_VERSION}"
  )
  list(APPEND HUNTER_REPOSITORIES "${reponame}")
  set(HUNTER_REPOSITORIES ${HUNTER_REPOSITORIES} PARENT_SCOPE)
  set(HUNTER_REPOSITORY_${reponame}_DIRECTORY "${rootdir}/Unpacked")
  set(
      HUNTER_REPOSITORY_${reponame}_DIRECTORY "${rootdir}/Unpacked"
      PARENT_SCOPE
  )
  set(HUNTER_REPOSITORY_${reponame}_URL "${har_URL}" PARENT_SCOPE)
  set(HUNTER_REPOSITORY_${reponame}_SHA1 "${har_SHA1}" PARENT_SCOPE)
  set(
      HUNTER_REPOSITORY_${reponame}_NAME "${HUNTER_CURRENT_REPOSITORY_NAME}"
      PARENT_SCOPE
  )
  set(HUNTER_REPOSITORY_${reponame}_NAME "${HUNTER_CURRENT_REPOSITORY_NAME}")
  set(
      HUNTER_REPOSITORY_${reponame}_VERSION
      "${HUNTER_CURRENT_REPOSITORY_VERSION}" PARENT_SCOPE
  )
  list(APPEND HUNTER_RECIPE_DIRS "${HUNTER_REPOSITORY_${reponame}_DIRECTORY}")
  set(HUNTER_RECIPE_DIRS ${HUNTER_RECIPE_DIRS} PARENT_SCOPE)
  # Pass on CMAKE_MODULE_PATH that might have been modified by repo's init
  # script
  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} PARENT_SCOPE)
  hunter_status_debug(
      "Added repository ${reponame} in "
      "${HUNTER_REPOSITORY_${reponame}_DIRECTORY}"
  )
endfunction()

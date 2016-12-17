include(hunter_test_string_not_empty)
include(hunter_status_debug)
include(hunter_internal_error)

# Install a remote repository
# This function should be called after testing whether the repo has already
# been installed.
function(hunter_install_repository rootdir url sha1)
  hunter_test_string_not_empty("${rootdir}")
  hunter_test_string_not_empty("${url}")
  hunter_test_string_not_empty("${sha1}")

  hunter_status_debug("Downloading external repository:")
  hunter_status_debug("   - url: ${url}")
  hunter_status_debug("   - sha1: ${sha1}")
  hunter_status_debug("   - location: ${rootdir}")

  file(REMOVE_RECURSE "${rootdir}/hunter_tmp/")

  file(MAKE_DIRECTORY "${rootdir}/hunter_tmp/")
  file(WRITE "${rootdir}/hunter_tmp/CMakeLists.txt"
      "cmake_minimum_required(VERSION 3.0)\n"
      "project(HunterRepo LANGUAGES NONE)\n"
      "include(ExternalProject)\n"
      "ExternalProject_Add(\n"
      "    Hunter\n"
      "    URL\n"
      "    \"${har_URL}\"\n"
      "    URL_HASH\n"
      "    SHA1=${har_SHA1}\n"
      "    DOWNLOAD_DIR\n"
      "    \"${rootdir}/hunter_tmp/\"\n"
      "    SOURCE_DIR\n"
      "    \"${rootdir}/Unpacked\"\n"
      "    CONFIGURE_COMMAND\n"
      "    \"\"\n"
      "    BUILD_COMMAND\n"
      "    \"\"\n"
      "    INSTALL_COMMAND\n"
      "    \"\"\n"
      ")\n"
  )

  if(HUNTER_STATUS_DEBUG)
    set(logging_params "")
  else()
    # set(logging_params OUTPUT_QUIET)
  endif()

  hunter_status_debug("Configure repo ${url} in ${rootdir}/hunter_tmp/Build")
  execute_process(
      COMMAND "${CMAKE_COMMAND}" "-H${rootdir}/hunter_tmp"
          "-B${rootdir}/hunter_tmp/Build" "-G${CMAKE_GENERATOR}"
      WORKING_DIRECTORY "${rootdir}/hunter_tmp"
      RESULT_VARIABLE download_result
      ${logging_params}
  )
  if(NOT download_result EQUAL 0)
    hunter_gate_internal_error("Configuring repository (${url}) failed")
  endif()

  hunter_status_debug("Installing repo ${url} to ${rootdir}/Unpacked")
  execute_process(
      COMMAND "${CMAKE_COMMAND}" --build "${rootdir}/hunter_tmp/Build"
      WORKING_DIRECTORY "${rootdir}"
      RESULT_VARIABLE download_result
      ${logging_params}
  )
  if(NOT download_result EQUAL 0)
    hunter_internal_error("Downloading/building repository (${url}) failed")
  endif()

  if(NOT EXISTS "${rootdir}/Unpacked/configs/default.cmake")
    hunter_internal_error("Repository (${url}) is missing default.cmake")
  endif()
  if(NOT EXISTS "${rootdir}/Unpacked/init.cmake")
    hunter_internal_error("Repository (${url}) is missing init.cmake")
  endif()
  if(NOT IS_DIRECTORY "${rootdir}/Unpacked/projects")
    hunter_internal_error(
        "Repository (${url}) is missing the projects directory"
    )
  endif()

  file(REMOVE_RECURSE "${rootdir}/hunter_tmp")
  file(WRITE "${rootdir}/Done" "${sha1}")
endfunction()

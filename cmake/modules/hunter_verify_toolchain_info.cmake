# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_get_temp_directory)
include(hunter_internal_error)
include(hunter_lock)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_unlock)

function(hunter_verify_toolchain_info)
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_SELF}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  if(HUNTER_CMAKE_GENERATOR)
    set(use_generator "-G${HUNTER_CMAKE_GENERATOR}")
  else()
    set(use_generator "")
  endif()

  if(CMAKE_TOOLCHAIN_FILE)
    set(use_toolchain "-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}")
  else()
    set(use_toolchain "")
  endif()

  if(HUNTER_SKIP_TOOLCHAIN_VERIFICATION)
    hunter_status_debug("Toolchain verification skipped")
    return()
  endif()

  hunter_status_print("verify toolchain")

  set(
      global_toolchain_info
      "${HUNTER_BASE}/Toolchains/${HUNTER_INSTALL_TAG}/toolchain.info"
  )

  hunter_get_temp_directory(
      "${PROJECT_BINARY_DIR}/_3rdParty/hunter/toolchain-info"
      temp_project_dir
  )
  hunter_test_string_not_empty("${temp_project_dir}")

  set(temp_build_dir "${temp_project_dir}/_builds")
  set(create_script "${HUNTER_SELF}/scripts/create-toolchain-info.cmake")

  if(NOT EXISTS "${global_toolchain_info}")
    hunter_lock()
    hunter_status_debug("${global_toolchain_info} not exists, run generate...")
    file(REMOVE_RECURSE "${temp_build_dir}")

    # create all directories
    file(WRITE "${temp_project_dir}/CMakeLists.txt" "###")

    configure_file(
         "${create_script}"
         "${temp_project_dir}/CMakeLists.txt"
         COPYONLY
    )
    execute_process(
        COMMAND
        "${CMAKE_COMMAND}"
        "-DTOOLCHAIN_INFO_FILE=${global_toolchain_info}"
        "${use_toolchain}"
        "-DHUNTER_SELF=${HUNTER_SELF}"
        ${use_generator}
        "-H${temp_project_dir}"
        "-B${temp_build_dir}"
        RESULT_VARIABLE
        generate_result
    )
    hunter_unlock()
    if(NOT generate_result EQUAL "0")
      hunter_internal_error(
          "Generate failed: exit with code ${generate_result}"
      )
    endif()
  endif()

  hunter_status_debug("Comparing with ${global_toolchain_info}")

  set(local_toolchain_info "${temp_project_dir}/local-info")
  set(TOOLCHAIN_INFO_FILE "${local_toolchain_info}")
  file(REMOVE "${TOOLCHAIN_INFO_FILE}")
  include("${create_script}")
  if(NOT EXISTS "${TOOLCHAIN_INFO_FILE}")
    hunter_internal_error("Info not generated")
  endif()

  file(READ "${local_toolchain_info}" local_info)
  file(READ "${global_toolchain_info}" global_info)

  string(COMPARE EQUAL "${local_info}" "${global_info}" is_equal)
  if(NOT is_equal)
    message(
        "\n"
        "Files differ:\n\n"
        "    ${local_toolchain_info}\n"
        "    ${global_toolchain_info}\n\n"
        "Effectively this means that toolchain changed during last build.\n"
        "Please compare this two files and fix it.\n"
        "Set HUNTER_SKIP_TOOLCHAIN_VERIFICATION to YES to ignore.\n"
    )
    hunter_fatal_error(
        "Toolchain verification failed"
        WIKI "https://github.com/ruslo/hunter/wiki/Error-%28toolchain-verification-failed%29"
    )
  endif()
endfunction()

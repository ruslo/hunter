# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_verify_toolchain_info)
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_DOWNLOAD_TOOLCHAIN}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_SELF}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")
  # HUNTER_DOWNLOAD_GENERATOR may be empty

  if(HUNTER_SKIP_TOOLCHAIN_VERIFICATION)
    hunter_status_debug("Toolchain verification skipped")
    return()
  endif()

  hunter_status_print("verify toolchain")

  set(
      saved_toolchain_info
      "${HUNTER_BASE}/Toolchains/${HUNTER_INSTALL_TAG}/toolchain.info"
  )

  set(temp_project_dir "${PROJECT_BINARY_DIR}/_3rdParty/hunter/toolchain-info")
  set(temp_build_dir "${temp_project_dir}/_builds")
  set(create_script "${HUNTER_SELF}/scripts/create-toolchain-info.cmake")

  file(REMOVE_RECURSE "${temp_build_dir}")
  # create all directories
  file(WRITE "${temp_project_dir}/CMakeLists.txt" "###")

  configure_file(
       "${create_script}"
       "${temp_project_dir}/CMakeLists.txt"
       COPYONLY
  )

  if(EXISTS "${saved_toolchain_info}")
    hunter_status_debug("${saved_toolchain_info} found, comparing")
    set(current_toolchain_info "${temp_build_dir}/current.info")
    execute_process(
        COMMAND
        "${CMAKE_COMMAND}"
        "-DTOOLCHAIN_INFO_FILE=${current_toolchain_info}"
        "-DCMAKE_TOOLCHAIN_FILE=${HUNTER_DOWNLOAD_TOOLCHAIN}"
        ${HUNTER_DOWNLOAD_GENERATOR}
        "-H${temp_project_dir}"
        "-B${temp_build_dir}"
        RESULT_VARIABLE
        generate_result
    )
    if(NOT generate_result EQUAL "0")
      hunter_fatal_error("Generate failed: exit with code ${generate_result}")
    endif()
    file(READ "${current_toolchain_info}" curr)
    file(READ "${saved_toolchain_info}" saved)
    string(COMPARE EQUAL "${curr}" "${saved}" is_equal)
    if(NOT is_equal)
      hunter_unlock()
      message(
          "\n"
          "Files differ:\n\n"
          "    ${current_toolchain_info}\n"
          "    ${saved_toolchain_info}\n\n"
          "Effectively this means that toolchain changed during last build.\n"
          "Please compare this two files and fix it.\n"
          "Set HUNTER_SKIP_TOOLCHAIN_VERIFICATION to YES to ignore.\n"
      )
      hunter_fatal_error("Toolchain verification failed")
    endif()
  else()
    hunter_status_debug("${saved_toolchain_info} not exists, run generate...")
    execute_process(
        COMMAND
        "${CMAKE_COMMAND}"
        "-DTOOLCHAIN_INFO_FILE=${saved_toolchain_info}"
        "-DCMAKE_TOOLCHAIN_FILE=${HUNTER_DOWNLOAD_TOOLCHAIN}"
        ${HUNTER_DOWNLOAD_GENERATOR}
        "-H${temp_project_dir}"
        "-B${temp_build_dir}"
        RESULT_VARIABLE
        generate_result
    )
    if(NOT generate_result EQUAL "0")
      hunter_fatal_error("Generate failed: exit with code ${generate_result}")
    endif()
  endif()
endfunction()

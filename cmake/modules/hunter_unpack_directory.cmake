# Copyright (c) 2015-2017, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_print_cmd)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_unpack_directory cache_sha1)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${cache_sha1}")

  if(CMAKE_HOST_UNIX)
    set(use_link_script TRUE)
  else()
    set(use_link_script FALSE)
  endif()

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  set(cellar_directory "${HUNTER_CACHED_ROOT}/_Base/Cellar")

  hunter_make_directory(
      "${cellar_directory}/${cache_sha1}"
      "${cache_sha1}"
      cellar_directory
  )

  set(unpack_stamp "${cellar_directory}/unpack.DONE")
  set(cellar_raw_directory "${cellar_directory}/raw")
  file(MAKE_DIRECTORY "${cellar_raw_directory}")

  set(list_of_directories "${cellar_directory}/directories.list")
  set(list_of_files "${cellar_directory}/files.list")
  set(link_script "${cellar_directory}/link-all.sh")
  set(shell "/bin/bash")

  set(archive_file "${cache_directory}/raw/${cache_sha1}.tar.bz2")
  if(NOT EXISTS "${archive_file}")
    hunter_internal_error("archive file not found: ${archive_file}")
  endif()

  if(NOT EXISTS "${unpack_stamp}")
    hunter_lock_directory("${cellar_directory}" "")
  endif()

  # While waiting for lock other instance can do all the job
  if(NOT EXISTS "${unpack_stamp}")
    set(cmd "${CMAKE_COMMAND}" "-E" "tar")
    if(HUNTER_STATUS_DEBUG AND NOT HUNTER_SUPPRESS_LIST_OF_FILES)
      list(APPEND cmd "xvf")
    else()
      list(APPEND cmd "xf")
    endif()
    list(APPEND cmd "${archive_file}")

    if(HUNTER_STATUS_DEBUG)
      set(logging_params "")
    elseif(HUNTER_STATUS_PRINT)
      set(logging_params "")
    else()
      set(logging_params "OUTPUT_QUIET")
    endif()

    hunter_status_debug("Unpacking to cellar:")
    hunter_status_debug("  ${archive_file}")
    hunter_status_debug("  -> ${cellar_raw_directory}")

    hunter_print_cmd("${cellar_raw_directory}" "${cmd}")

    execute_process(
        COMMAND ${cmd}
        WORKING_DIRECTORY "${cellar_raw_directory}"
        RESULT_VARIABLE unpacking_result
        ${logging_params}
    )

    if(unpacking_result EQUAL 0)
      hunter_status_debug("Unpacked successfully")
    else()
      hunter_internal_error("Unpack failed")
    endif()

    # For LIST_DIRECTORIES
    if(CMAKE_VERSION VERSION_LESS 3.3 AND use_link_script)
      hunter_internal_error(
          "CMake version 3.3 at least needed."
          "Current version is ${CMAKE_VERSION}."
      )
    endif()

    hunter_status_debug("Creating list of files and directories")
    file(
        GLOB_RECURSE
        all
        LIST_DIRECTORIES true
        RELATIVE "${cellar_raw_directory}"
        "${cellar_raw_directory}/*"
    )

    set(files "")
    set(directories "")
    foreach(x ${all})
      if(IS_DIRECTORY "${cellar_raw_directory}/${x}")
        list(APPEND directories "${x}")
      else()
        list(APPEND files "${x}")
      endif()
    endforeach()

    # Create link script {
    file(WRITE "${link_script}" "#!${shell}\n")
    file(APPEND "${link_script}" "\n")
    file(
        APPEND
        "${link_script}"
        "export \"HUNTER_CELLAR_RAW_DIRECTORY=${cellar_raw_directory}\"\n\n"
    )
    foreach(x ${files})
      file(
          APPEND
          "${link_script}"
          "ln \\\n  \"\${HUNTER_CELLAR_RAW_DIRECTORY}/${x}\" \\\n  \"\$1/${x}\"\n\n"
       )
    endforeach()
    # }

    string(REPLACE ";" "\n" files "${files}")
    string(REPLACE ";" "\n" directories "${directories}")

    file(WRITE "${list_of_files}" "${files}\n")
    file(WRITE "${list_of_directories}" "${directories}\n")

    file(WRITE "${unpack_stamp}" "")
  endif()

  hunter_status_debug("Creating directories")
  file(STRINGS "${list_of_directories}" directories)
  foreach(x ${directories})
    file(MAKE_DIRECTORY "${HUNTER_INSTALL_PREFIX}/${x}")
  endforeach()

  hunter_status_debug("Removing old files")
  file(STRINGS "${list_of_files}" files)
  foreach(x ${files})
    file(REMOVE "${HUNTER_INSTALL_PREFIX}/${x}")
  endforeach()

  if(use_link_script)
    hunter_status_debug("Linking files")
    if(NOT EXISTS "${shell}")
      hunter_internal_error("File not found: '${shell}'")
    endif()
    set(cmd "${shell}" "${link_script}" "${HUNTER_INSTALL_PREFIX}")
    hunter_print_cmd("${cellar_directory}" "${cmd}")
    execute_process(
        COMMAND ${cmd}
        WORKING_DIRECTORY "${cellar_directory}"
        RESULT_VARIABLE result
    )

    if(NOT result EQUAL 0)
      hunter_internal_error("Link script failed")
    endif()
  else()
    hunter_status_debug("Copying files")
    foreach(x ${files})
      set(full_dst_path "${HUNTER_INSTALL_PREFIX}/${x}")
      get_filename_component(dst_dir "${full_dst_path}" DIRECTORY)
      file(COPY "${cellar_raw_directory}/${x}" DESTINATION "${dst_dir}")
    endforeach()
  endif()
endfunction()

# Copyright (c) 2015-2016, Ruslan Baratov
# All rights reserved.

include(hunter_add_package)
include(hunter_cache_run)
include(hunter_create_cache_meta_directory)
include(hunter_create_dependency_entry)
include(hunter_download_cache_meta_file)
include(hunter_download_cache_raw_file)
include(hunter_internal_error)
include(hunter_patch_unrelocatable_text_files)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_unpack_directory)

# Try to load package from cache
# Set DONE stamp on success
# Notes:
#   1. Skip everything if package is not cacheable (HUNTER_PACKAGE_CACHEABLE)
#   2. Save SHA1 of non-install packages (HUNTER_PACKAGE_SCHEME_INSTALL)
#   3. Toolchain-ID directory already locked
#   4. Cache directory is not locked
function(hunter_load_from_cache)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_DONE_STAMP}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_HOME_DIR}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_SHA1}")

  hunter_test_string_not_empty("${CMAKE_BINARY_DIR}")

  set(human_readable "${HUNTER_PACKAGE_NAME}")
  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)
  if(has_component)
    set(human_readable "${human_readable} (comp.: ${HUNTER_PACKAGE_COMPONENT})")
  endif()

  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
      ""
      has_internal_deps_id
  )

  set(cache_file "${HUNTER_PACKAGE_HOME_DIR}/cache.sha1")

  if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
    # We only need to save cache.sha1 file:
    #   * no dependencies possible
    #   * cache SHA1 = archive SHA1
    file(WRITE "${cache_file}" "${HUNTER_PACKAGE_SHA1}")
    hunter_status_debug(
        "Non-install saved: ${cache_file} (${HUNTER_PACKAGE_SHA1})"
    )
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-install package"
      )
    endif()
    return()
  endif()

  if(NOT HUNTER_PACKAGE_CACHEABLE)
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-cacheable package"
      )
    endif()
    return()
  endif()

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  hunter_create_cache_meta_directory("${cache_directory}" cache_meta_dir)

  set(basic_deps_done "${cache_meta_dir}/basic-deps.DONE")
  set(basic_deps_info "${cache_meta_dir}/basic-deps.info")

  hunter_download_cache_meta_file(
      LOCAL "${basic_deps_info}" DONE "${basic_deps_done}"
  )

  if(NOT EXISTS "${basic_deps_done}")
    hunter_status_debug(
        "Cache miss (no basic dependencies info found: ${basic_deps_done})"
    )
    return()
  endif()

  if(NOT EXISTS "${basic_deps_info}")
    hunter_internal_error("File not exists: ${basic_deps_info}")
  endif()

  # Before cache run, for dependency registration.
  set(
      HUNTER_PARENT_PACKAGE
      "${HUNTER_PACKAGE_NAME};${HUNTER_PACKAGE_COMPONENT}"
  )

  hunter_status_debug("HUNTER_PARENT_PACKAGE: ${HUNTER_PARENT_PACKAGE}")
  hunter_status_debug("Loading basic dependencies: ${basic_deps_info}")

  file(STRINGS "${basic_deps_info}" basic_deps_list)
  foreach(dependency_string ${basic_deps_list})
    string(REPLACE " " ";" dependency_list "${dependency_string}")
    list(LENGTH dependency_list len)
    if(len EQUAL 1)
      # only package
      set(package "${dependency_list}")
      set(component "")
    elseif(len EQUAL 2)
      # package and component
      list(GET dependency_list 0 package)
      list(GET dependency_list 1 component)
    else()
      hunter_internal_error("Invalid format")
    endif()
    hunter_cache_run(PACKAGE "${package}" COMPONENT "${component}")

    # Check cache found for package
    hunter_create_dependency_entry(
        PACKAGE "${package}" COMPONENT "${component}" RESULT package_sha1
    )
    if(package_sha1 STREQUAL "")
      hunter_status_debug(
          "Cache miss (entry for package: ${package}/${component})"
      )
      return()
    endif()
  endforeach()

  hunter_status_debug("Loading basic dependencies finished")

  # Note: we can't use cache directory since it need to be locked in this case
  set(temp_deps_info "${CMAKE_BINARY_DIR}/_3rdParty/hunter/deps.info")
  file(REMOVE "${temp_deps_info}")
  hunter_create_deps_info("${temp_deps_info}")
  if(NOT EXISTS "${temp_deps_info}")
    hunter_internal_error("Dependency list is not created: ${temp_deps_info}")
  endif()

  file(SHA1 "${temp_deps_info}" deps_sha1)

  file(READ "${temp_deps_info}" expected_deps_info)
  hunter_status_debug("Expected deps (${deps_sha1}):\n${expected_deps_info}")

  hunter_make_directory("${cache_meta_dir}" "${deps_sha1}" cache_meta_dir)

  set(from_server_file "${cache_meta_dir}/from.server")
  set(cache_sha1_file "${cache_meta_dir}/cache.sha1")
  set(cache_done_file "${cache_meta_dir}/CACHE.DONE")

  hunter_download_cache_meta_file(
      LOCAL "${cache_sha1_file}" DONE "${cache_done_file}"
  )

  if(NOT EXISTS "${cache_done_file}")
    hunter_status_debug(
        "Cache miss (no entry found: ${cache_meta_dir}/CACHE.DONE)"
    )
    return()
  endif()

  hunter_status_print("Cache HIT: ${human_readable}")

  if(NOT EXISTS "${cache_sha1_file}")
    hunter_internal_error("cache.sha1 not exists")
  endif()
  hunter_status_print("Cache info: ${cache_sha1_file}")
  file(COPY "${cache_sha1_file}" DESTINATION "${HUNTER_PACKAGE_HOME_DIR}")

  if(HUNTER_CACHE_RUN)
    hunter_status_debug("CACHE RUN (Exit now)")
    return()
  endif()

  # Install dependencies
  file(STRINGS "${basic_deps_info}" basic_deps_list)
  foreach(dependency_string ${basic_deps_list})
    string(REPLACE " " ";" dependency_list "${dependency_string}")
    list(LENGTH dependency_list len)
    if(len EQUAL 1)
      # only package
      hunter_add_package("${dependency_list}")
    elseif(len EQUAL 2)
      # package and component
      list(GET dependency_list 0 package)
      list(GET dependency_list 1 component)
      hunter_add_package("${package}" COMPONENTS "${component}")
    else()
      hunter_internal_error("Invalid format")
    endif()
  endforeach()

  # Unpack cache archive
  file(READ "${cache_sha1_file}" cache_sha1)
  set(archive_file "${cache_directory}/raw/${cache_sha1}.tar.bz2")

  hunter_download_cache_raw_file(
      LOCAL "${archive_file}"
      SHA1 "${cache_sha1}"
      FROMSERVER "${from_server_file}"
  )

  if(NOT EXISTS "${archive_file}")
    hunter_internal_error("archive file not found: ${archive_file}")
  endif()
  hunter_unpack_directory("${archive_file}" "${HUNTER_INSTALL_PREFIX}")

  hunter_patch_unrelocatable_text_files(
      FROM "__HUNTER_PACKAGE_INSTALL_PREFIX__"
      TO "${HUNTER_INSTALL_PREFIX}"
      INSTALL_PREFIX "${HUNTER_INSTALL_PREFIX}"
  )

  file(WRITE "${HUNTER_PACKAGE_DONE_STAMP}" "")
endfunction()

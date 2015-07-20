# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_create_cache_meta_directory)
include(hunter_get_dependency_list)
include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_make_directory)
include(hunter_pack_directory)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_unpack_directory)

# Save results of install
# Note:
#  1. Non-install schemes is always cacheable (HUNTER_PACKAGE_SCHEME_INSTALL)
#  2. Skip everything if package is not cacheable (HUNTER_PACKAGE_CACHEABLE)
#  3. Pack everything from HUNTER_PACKAGE_INSTALL_PREFIX to Cache
#  4. Unpack archive from Cache to HUNTER_INSTALL_PREFIX
#  5. Save cache.sha1 file
function(hunter_save_to_cache)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_HOME_DIR}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")

  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
      ""
      has_internal_deps_id
  )

  set(human_readable "${HUNTER_PACKAGE_NAME}")
  if(has_component)
    set(
        human_readable
        "${human_readable} (component: ${HUNTER_PACKAGE_COMPONENT})"
    )
  endif()
  hunter_status_debug("Saving to cache: ${human_readable}")

  set(cache_file "${HUNTER_PACKAGE_HOME_DIR}/cache.sha1")

  ### Non-install packages must be saved already (see hunter_load_from_cache)
  if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
    if(NOT EXISTS "${cache_file}")
      hunter_internal_error("Cache file not found")
    endif()
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-install package"
      )
    endif()
    hunter_status_debug("Non-install (already cached)")
    return()
  endif()

  ### Skip non-cacheable
  if(NOT HUNTER_PACKAGE_CACHEABLE)
    hunter_status_debug("Not cacheable")
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-cacheable package"
      )
    endif()
    return()
  endif()

  ### Lock cache directory
  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  hunter_lock_directory("${cache_directory}" "")

  ### Save local install directory to cache archive
  hunter_pack_directory(
      "${HUNTER_PACKAGE_INSTALL_PREFIX}"
      "${cache_directory}/raw"
      archive_sha1
  )

  hunter_test_string_not_empty("${archive_sha1}")
  set(archive_file "${cache_directory}/raw/${archive_sha1}.tar.bz2")
  if(NOT EXISTS "${archive_file}")
    hunter_internal_error("Archive not exists: ${archive_file}")
  endif()

  ### Install to global directory from cache archive
  hunter_unpack_directory("${archive_file}" "${HUNTER_INSTALL_PREFIX}")

  ### Save cache meta-data
  hunter_create_cache_meta_directory("${cache_directory}" cache_meta_dir)
  hunter_test_string_not_empty("${cache_meta_dir}")

  ### create cache.sha1 file in home (before saving dependencies)
  file(WRITE "${HUNTER_PACKAGE_HOME_DIR}/cache.sha1" "${archive_sha1}")

  # Get package dependencies
  hunter_get_dependency_list(dep_list)

  # Save package dependencies to file
  set(deps_info "${HUNTER_PACKAGE_HOME_DIR}/deps.info")
  file(WRITE "${deps_info}" "")

  list(LENGTH dep_list len)
  if(len EQUAL 0)
    hunter_status_debug("No dependencies for package: ${human_readable}")
  else()
    hunter_status_debug("Dependencies for package: ${human_readable}")
    foreach(dependency_entry ${dep_list})
      hunter_status_debug("  ${dependency_entry}")
      file(APPEND "${deps_info}" "${dependency_entry}\n")
    endforeach()
  endif()

  file(SHA1 "${deps_info}" deps_sha1)
  hunter_make_directory("${cache_meta_dir}" "${deps_sha1}" cache_meta_dir)
  file(COPY "${deps_info}" DESTINATION "${cache_meta_dir}")

  hunter_status_debug("Dependencies saved: ${deps_info}")

  file(WRITE "${cache_meta_dir}/cache.sha1" "${archive_sha1}")
  file(WRITE "${cache_meta_dir}/CACHE.DONE" "")
endfunction()

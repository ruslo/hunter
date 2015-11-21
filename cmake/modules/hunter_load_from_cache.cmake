# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_add_package)
include(hunter_cache_run)
include(hunter_create_cache_meta_directory)
include(hunter_create_dependency_entry)
include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_unpack_directory)

# Try to load package from cache
# Set DONE stamp on success
# Notes:
#   1. Skip everything if package is not cacheable (HUNTER_PACKAGE_CACHEABLE)
#   2. Save SHA1 of non-install packages (HUNTER_PACKAGE_SCHEME_INSTALL)
#   3. Toolchain-ID directory already locked
function(hunter_load_from_cache)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_DONE_STAMP}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_HOME_DIR}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_SHA1}")

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

  file(GLOB_RECURSE cache_done_list "${cache_meta_dir}/*/CACHE.DONE")
  list(LENGTH cache_done_list list_len)
  if(list_len EQUAL 0)
    hunter_status_debug("No cache entries for ${cache_meta_dir}")
    return()
  endif()

  foreach(cache_done_file ${cache_done_list})
    get_filename_component(dep_id_dir "${cache_done_file}" DIRECTORY)
    hunter_status_debug("Checking cache directory: ${dep_id_dir}")
    set(deps_info "${dep_id_dir}/deps.info")
    if(NOT EXISTS "${deps_info}")
      hunter_internal_error("deps.info not found")
    endif()

    file(STRINGS "${deps_info}" dep_list)
    set(cache_hit TRUE)
    foreach(dep_entry ${dep_list})
      string(REPLACE " " ";" dep_entry_list "${dep_entry}")
      list(LENGTH dep_entry_list len)
      if(len EQUAL 2)
        # <package> <sha1>
        list(GET dep_entry_list 0 package)
        list(GET dep_entry_list 1 cached_sha1)
        set(component "")
      elseif(len EQUAL 3)
        # <package> <component> <sha1>
        list(GET dep_entry_list 0 package)
        list(GET dep_entry_list 1 component)
        list(GET dep_entry_list 2 cached_sha1)
      else()
        hunter_internal_error("Bad format: ${dep_entry}")
      endif()

      # Load cache.sha1 file from cache if package is cached
      # This function will not install anything, just cache checking
      hunter_cache_run(PACKAGE "${package}" COMPONENT "${component}")

      # Read
      hunter_create_dependency_entry(
          PACKAGE "${package}" COMPONENT "${component}" RESULT package_sha1
      )
      if(package_sha1 STREQUAL "")
        hunter_status_debug(
            "No cache entry for package: ${package}/${component}"
        )
        set(cache_hit FALSE)
        break()
      endif()
      if(NOT dep_entry STREQUAL package_sha1)
        hunter_status_debug("Cache miss for package ${package}/${component}:")
        hunter_status_debug("  Expected `${dep_entry}`")
        hunter_status_debug("  Got `${package_sha1}`")
        set(cache_hit FALSE)
        break()
      endif()
    endforeach()

    if(cache_hit)
      hunter_status_print("Cache HIT: ${human_readable}")

      set(cache_sha1_file "${dep_id_dir}/cache.sha1")
      if(NOT EXISTS "${cache_sha1_file}")
        hunter_internal_error("cache.sha1 not exists")
      endif()
      file(COPY "${cache_sha1_file}" DESTINATION "${HUNTER_PACKAGE_HOME_DIR}")

      if(HUNTER_CACHE_RUN)
        hunter_status_debug("CACHE RUN (Exit now)")
        return()
      endif()

      # Do real install now
      set(
          HUNTER_PARENT_PACKAGE
          "${HUNTER_PACKAGE_NAME};${HUNTER_PACKAGE_COMPONENT}"
      )

      # Install dependencies
      foreach(dep_entry ${dep_list})
        string(REPLACE " " ";" dep_entry "${dep_entry}")
        list(LENGTH dep_entry len)
        if(len EQUAL 2)
          # <package> <sha1>
          list(GET dep_entry 0 package)
          hunter_add_package("${package}")
        elseif(len EQUAL 3)
          # <package> <component> <sha1>
          list(GET dep_entry 0 package)
          list(GET dep_entry 1 component)
          hunter_add_package("${package}" COMPONENTS "${component}")
        else()
          hunter_internal_error("Bad format: ${dep_entry}")
        endif()
      endforeach()

      # Unpack cache archive
      file(READ "${cache_sha1_file}" cache_sha1)
      set(archive_file "${cache_directory}/raw/${cache_sha1}.tar.bz2")
      if(NOT EXISTS "${archive_file}")
        hunter_internal_error("archive file not found: ${archive_file}")
      endif()
      hunter_unpack_directory("${archive_file}" "${HUNTER_INSTALL_PREFIX}")
      file(WRITE "${HUNTER_PACKAGE_DONE_STAMP}" "")
      return()
    endif()
  endforeach()
  hunter_status_debug("Cache MISS: ${human_readable}")
endfunction()

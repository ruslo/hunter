# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_assert_not_empty_string)
include(hunter_upload_single_file)

function(hunter_upload_to_custom_server)
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")

  set(cache_root_dir "${HUNTER_CACHED_ROOT}/_Base/Cache")
  if(NOT EXISTS ${cache_root_dir})
    hunter_internal_error("Not found: ${cache_root_dir}")
  endif()

  file(
      GLOB_RECURSE
      cache_done_list
      RELATIVE
      ${cache_root_dir}
      "${cache_root_dir}/*/CACHE.DONE"
  )

  foreach(cache_done_file ${cache_done_list})
    get_filename_component(deps_id_dir ${cache_done_file} DIRECTORY)
    get_filename_component(internal_deps_id_dir ${deps_id_dir} DIRECTORY)
    get_filename_component(types_id_dir ${internal_deps_id_dir} DIRECTORY)
    get_filename_component(args_id_dir ${types_id_dir} DIRECTORY)
    get_filename_component(archive_id_dir ${args_id_dir} DIRECTORY)
    get_filename_component(version_dir ${archive_id_dir} DIRECTORY)
    get_filename_component(component_dir ${version_dir} DIRECTORY)

    get_filename_component(component_name ${component_dir} NAME)
    if(component_name MATCHES "^__")
      # We have component
      get_filename_component(package_dir ${component_dir} DIRECTORY)
    else()
      # No component
      set(package_dir ${component_dir})
    endif()

    get_filename_component(toolchain_id_dir ${package_dir} DIRECTORY)
    get_filename_component(meta_dir ${toolchain_id_dir} DIRECTORY)

    string(COMPARE EQUAL "${meta_dir}" "meta" match)
    if(NOT match)
      hunter_internal_error("Unexpected 'meta' directory: '${meta_dir}'")
    endif()

    set(from_server_path "${cache_root_dir}/${deps_id_dir}/from.server")
    if(EXISTS "${from_server_path}")
      hunter_status_debug("Skip. File present: ${from_server_path}")
      continue()
    endif()

    set(deps_info_path "${cache_root_dir}/${deps_id_dir}/deps.info")
    if(NOT EXISTS "${deps_info_path}")
      hunter_status_debug("Skip. File not found: ${deps_info_path}")
      continue()
    endif()

    set(cache_sha1_path "${cache_root_dir}/${deps_id_dir}/cache.sha1")
    if(NOT EXISTS "${cache_sha1_path}")
      hunter_status_debug("Skip. File not found: ${cache_sha1_path}")
      continue()
    endif()

    file(READ "${cache_sha1_path}" cache_sha1)

    set(raw_path "${cache_root_dir}/raw/${cache_sha1}.tar.bz2")
    if(NOT EXISTS "${raw_path}")
      hunter_status_debug("Skip. File not found: ${raw_path}")
      continue()
    endif()

    hunter_upload_single_file(${toolchain_id_dir}/toolchain.info)
    hunter_upload_single_file(${args_id_dir}/args.cmake)
    hunter_upload_single_file(${types_id_dir}/types.info)
    hunter_upload_single_file(${internal_deps_id_dir}/internal_deps.id)
    hunter_upload_single_file(${internal_deps_id_dir}/basic-deps.info)
    hunter_upload_single_file(${internal_deps_id_dir}/basic-deps.DONE)
    hunter_upload_single_file(${deps_id_dir}/cache.sha1)
    hunter_upload_single_file(${deps_id_dir}/deps.info)

    hunter_upload_single_file(raw/${cache_sha1}.tar.bz2)

    hunter_upload_single_file(${deps_id_dir}/CACHE.DONE)
    file(WRITE "${cache_root_dir}/${deps_id_dir}/from.server" "")
  endforeach()
endfunction()

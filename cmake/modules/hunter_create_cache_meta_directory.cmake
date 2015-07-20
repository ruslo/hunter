# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_make_directory)
include(hunter_test_string_not_empty)

function(hunter_create_cache_meta_directory cache_directory result)
  hunter_test_string_not_empty("${HUNTER_ARGS_FILE}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_CONFIGURATION_TYPES}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_HOME_DIR}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_SHA1}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_VERSION}")
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_ID_PATH}")
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_SHA1}")
  hunter_test_string_not_empty("${cache_directory}")
  hunter_test_string_not_empty("${result}")

  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)

  # Save toolchain-id
  hunter_make_directory(
      "${cache_directory}/meta" "${HUNTER_TOOLCHAIN_SHA1}" cache_meta_dir
  )
  set(toolchain_info "${HUNTER_TOOLCHAIN_ID_PATH}/toolchain.info")
  if(NOT EXISTS "${toolchain_info}")
    hunter_internal_error("Not exists: ${toolchain_info}")
  endif()
  file(COPY "${toolchain_info}" DESTINATION "${cache_meta_dir}")

  # Save package name and version
  set(cache_meta_dir "${cache_meta_dir}/${HUNTER_PACKAGE_NAME}")
  if(has_component)
    set(cache_meta_dir "${cache_meta_dir}/__${HUNTER_PACKAGE_COMPONENT}")
  endif()
  set(cache_meta_dir "${cache_meta_dir}/${HUNTER_PACKAGE_VERSION}")

  # Save package archive-id
  hunter_make_directory(
      "${cache_meta_dir}" "${HUNTER_PACKAGE_SHA1}" cache_meta_dir
  )

  # Save package args
  if(NOT EXISTS "${HUNTER_ARGS_FILE}")
    hunter_internal_error("Args file missing")
  endif()
  file(SHA1 "${HUNTER_ARGS_FILE}" args_sha1)
  hunter_make_directory("${cache_meta_dir}" "${args_sha1}" cache_meta_dir)
  file(COPY "${HUNTER_ARGS_FILE}" DESTINATION "${cache_meta_dir}")

  # Save package configuration types
  set(types_info "${HUNTER_PACKAGE_HOME_DIR}/types.info")
  file(WRITE "${types_info}" "${HUNTER_PACKAGE_CONFIGURATION_TYPES}")
  file(SHA1 "${types_info}" types_sha1)
  hunter_make_directory("${cache_meta_dir}" "${types_sha1}" cache_meta_dir)
  file(COPY "${types_info}" DESTINATION "${cache_meta_dir}")

  # Save internal-dependencies information
  set(internal_deps_id "${HUNTER_PACKAGE_HOME_DIR}/internal_deps.id")
  file(WRITE "${internal_deps_id}" "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}")
  file(SHA1 "${internal_deps_id}" internal_deps_sha1)
  hunter_make_directory(
      "${cache_meta_dir}" "${internal_deps_sha1}" cache_meta_dir
  )
  file(COPY "${internal_deps_id}" DESTINATION "${cache_meta_dir}")

  set("${result}" "${cache_meta_dir}" PARENT_SCOPE)
endfunction()

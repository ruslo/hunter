# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_apply_copy_rules)
  hunter_assert_not_empty_string("${HUNTER_INSTALL_PREFIX}")

  get_property(copy_list GLOBAL PROPERTY HUNTER_COPY_FILES)

  foreach(x ${copy_list})
    if(NOT EXISTS "${x}")
      hunter_internal_error("File not found: ${x}")
    endif()
    get_property(dst_relative_dir GLOBAL PROPERTY "HUNTER_DST_RELATIVE_DIR_${x}")
    if(NOT dst_relative_dir)
      hunter_internal_error("HUNTER_DST_RELATIVE_DIR property not found for file '${x}'")
    endif()
    set(dst "${HUNTER_INSTALL_PREFIX}/${dst_relative_dir}")
    hunter_status_debug("Copying file:")
    hunter_status_debug("  ${x}")
    hunter_status_debug("  -> ${dst}")
    file(COPY "${x}" DESTINATION "${dst}")
  endforeach()
  set_property(GLOBAL PROPERTY HUNTER_COPY_FILES "")
endfunction()

# ----------------------------------------------------------------------
# Auto creation of CMake targets from pkg-config
#
# Copyright (C) 2017 Alexandre Pretyman. All rights reserved.
#
# Looks for a pkgconfig module of a given name and exports a cmake
# target under the namespace PkgConfig::<pkg-config module>.
# ----------------------------------------------------------------------

include(FindPkgConfig)

include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_pkgconfig_export_target PKG_CONFIG_MODULE)
  set(target_name "PkgConfig::${PKG_CONFIG_MODULE}")
  if(TARGET "${target_name}")
    return()
  endif()
  pkg_check_modules(${PKG_CONFIG_MODULE} ${PKG_CONFIG_MODULE})
  if(NOT ${PKG_CONFIG_MODULE}_FOUND)
    hunter_internal_error(
        "Could not find pkg-config module: ${PKG_CONFIG_MODULE}"
    )
  endif()
  add_library("${target_name}" INTERFACE IMPORTED GLOBAL)

  # --- INTERFACE_INCLUDE_DIRECTORIES begin ---
  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} INCLUDE_DIRS: ${${PKG_CONFIG_MODULE}_INCLUDE_DIRS}"
  )
  string(COMPARE NOTEQUAL
      "${${PKG_CONFIG_MODULE}_INCLUDE_DIRS}"
      ""
      has_include_dirs
  )
  if(has_include_dirs)
    set_target_properties("${target_name}"
        PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES
          "${${PKG_CONFIG_MODULE}_INCLUDE_DIRS}"
    )
  endif()
  # --- INTERFACE_INCLUDE_DIRECTORIES end ---

  # --- INTERFACE_LINK_LIBRARIES begin ---
  set(link_libs)

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} LDFLAGS: ${${PKG_CONFIG_MODULE}_LDFLAGS}"
  )
  string(COMPARE NOTEQUAL
      "${${PKG_CONFIG_MODULE}_LDFLAGS}"
      ""
      has_ldflags
  )
  if(has_ldflags)
    list(APPEND link_libs ${${PKG_CONFIG_MODULE}_LDFLAGS})
  endif()

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} LDFLAGS_OTHER: ${${PKG_CONFIG_MODULE}_LDFLAGS_OTHER}"
  )
  string(COMPARE NOTEQUAL
      "${${PKG_CONFIG_MODULE}_LDFLAGS_OTHER}"
      ""
      has_ldflags_other
  )
  if(has_ldflags_other)
    list(APPEND link_libs ${${PKG_CONFIG_MODULE}_LDFLAGS_OTHER})
  endif()

  # No need to treat the pkg-config module's _LIBRARY_DIRS and _LIBRARIES
  # as they are already included in LD_FLAGS
  string(COMPARE NOTEQUAL
      "${link_libs}"
      ""
      has_link_libs
  )
  if(has_link_libs)
    set_target_properties("${target_name}"
        PROPERTIES
          INTERFACE_LINK_LIBRARIES
          "${link_libs}"
    )
  endif()
  # --- INTERFACE_LINK_LIBRARIES begin ---

  # --- INTERFACE_COMPILE_OPTIONS begin ---
  set(compile_opts)

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} CFLAGS: ${${PKG_CONFIG_MODULE}_CFLAGS}"
  )
  string(COMPARE NOTEQUAL
      "${${PKG_CONFIG_MODULE}_CFLAGS}"
      ""
      has_cflags)
  if(has_cflags)
    list(APPEND compile_opts ${${PKG_CONFIG_MODULE}_CFLAGS})
  endif()

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} CFLAGS_OTHER: ${${PKG_CONFIG_MODULE}_CFLAGS_OTHER}"
  )
  string(COMPARE NOTEQUAL
      "${${PKG_CONFIG_MODULE}_CFLAGS_OTHER}"
      ""
      has_cflags_other
  )
  if(has_cflags_other)
    list(APPEND compile_opts ${${PKG_CONFIG_MODULE}_CFLAGS_OTHER})
  endif()

  string(COMPARE NOTEQUAL
     "${compile_opts}"
     ""
     has_compile_opts
  )
  if(has_compile_opts)
      set_target_properties("${target_name}"
          PROPERTIES
            INTERFACE_COMPILE_OPTIONS
            "${compile_opts}"
      )
  endif()
  # --- INTERFACE_COMPILE_OPTIONS end ---
endfunction()


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

# Packages to test this function:
# * x11
# * x264
# * xcb
function(hunter_pkgconfig_export_target PKG_CONFIG_MODULE PKG_GENERATE_SHARED)
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

  if(${PKG_GENERATE_SHARED})
    set(PKG_CONFIG_PREFIX "${PKG_CONFIG_MODULE}")
  else()
    set(PKG_CONFIG_PREFIX "${PKG_CONFIG_MODULE}_STATIC")
  endif()

  hunter_status_debug(
    "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} Using prefix ${PKG_CONFIG_PREFIX}"
  )

  # --- INTERFACE_INCLUDE_DIRECTORIES begin ---
  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} INCLUDE_DIRS: ${${PKG_CONFIG_PREFIX}_INCLUDE_DIRS}"
  )
  if(NOT "${${PKG_CONFIG_PREFIX}_INCLUDE_DIRS}" STREQUAL "")
    set_target_properties("${target_name}"
        PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES
          "${${PKG_CONFIG_PREFIX}_INCLUDE_DIRS}"
    )
  endif()
  # --- INTERFACE_INCLUDE_DIRECTORIES end ---

  # --- INTERFACE_LINK_LIBRARIES begin ---
  set(link_libs)

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} LDFLAGS: ${${PKG_CONFIG_PREFIX}_LDFLAGS}"
  )
  if(NOT "${${PKG_CONFIG_PREFIX}_LDFLAGS}" STREQUAL "")
    # turn "-framework;A;-framework;B" into "-framework A;-framework B"
    string(REPLACE "-framework;" "-framework " ldflags "${${PKG_CONFIG_PREFIX}_LDFLAGS}")
    list(APPEND link_libs ${ldflags})
  endif()

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} LDFLAGS_OTHER: ${${PKG_CONFIG_PREFIX}_LDFLAGS_OTHER}"
  )
  if(NOT "${${PKG_CONFIG_PREFIX}_LDFLAGS_OTHER}" STREQUAL "")
    # turn "-framework;A;-framework;B" into "-framework A;-framework B"
    string(REPLACE "-framework;" "-framework " ldflags_other "${${PKG_CONFIG_PREFIX}_LDFLAGS_OTHER}")
    list(APPEND link_libs ${ldflags_other})
  endif()

  # No need to treat the pkg-config module's _LIBRARY_DIRS and _LIBRARIES
  # as they are already included in LD_FLAGS
  if(NOT "${link_libs}" STREQUAL "")
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
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} CFLAGS: ${${PKG_CONFIG_PREFIX}_CFLAGS}"
  )
  if(NOT "${${PKG_CONFIG_PREFIX}_CFLAGS}" STREQUAL "")
    list(APPEND compile_opts ${${PKG_CONFIG_PREFIX}_CFLAGS})
  endif()

  hunter_status_debug(
      "PKG_CONFIG_MODULE ${PKG_CONFIG_MODULE} CFLAGS_OTHER: ${${PKG_CONFIG_PREFIX}_CFLAGS_OTHER}"
  )
  if(NOT "${${PKG_CONFIG_PREFIX}_CFLAGS_OTHER}" STREQUAL "")
    list(APPEND compile_opts ${${PKG_CONFIG_PREFIX}_CFLAGS_OTHER})
  endif()

  if(NOT "${compile_opts}" STREQUAL "")
      set_target_properties("${target_name}"
          PROPERTIES
            INTERFACE_COMPILE_OPTIONS
            "${compile_opts}"
      )
  endif()
  # --- INTERFACE_COMPILE_OPTIONS end ---
endfunction()

# ----------------------------------------------------------------------
# Findodb.cmake - odb CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("ODB_ROOT: ${ODB_ROOT}")

find_path(
    ODB_INCLUDE_DIR
      odb/core.hxx
    PATHS
      "${ODB_ROOT}/include"
    NO_DEFAULT_PATH
)

hunter_status_debug("ODB_INCLUDE_DIR: ${ODB_INCLUDE_DIR}")

set(ODB_INCLUDE_DIRS "${ODB_INCLUDE_DIR}")
find_library(
    ODB_CORE_LIBRARY
      odb
    PATHS
      "${ODB_ROOT}/lib"
    NO_DEFAULT_PATH
)

hunter_status_debug("ODB_CORE_LIBRARY: ${ODB_CORE_LIBRARY}")

if(NOT TARGET "odb")
  if(NOT ODB_CORE_LIBRARY)
    message(FATAL_ERROR "ODB_CORE_LIBRARY not found!")
  endif()
  add_library("odb" UNKNOWN IMPORTED)
  set_target_properties(
      "odb"
      PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${ODB_INCLUDE_DIR}"
        IMPORTED_LOCATION "${ODB_CORE_LIBRARY}"
  )
  get_filename_component(ODB_LIB_DIR "${ODB_CORE_LIBRARY}" DIRECTORY CACHE)
  hunter_status_debug("ODB_LIB_DIR: ${ODB_LIB_DIR}")
  set(ODB_FOUND TRUE)
endif()

#AWP: if the compiler is listed at the components, treat it differently
list(FIND odb_FIND_COMPONENTS "compiler" _compiler_index)
if(_compiler_index GREATER -1)
  set(odb-compiler_FIND_REQUIRED "${odb_FIND_REQUIRED}")
  include(Findodb-compiler)
  list(REMOVE_AT odb_FIND_COMPONENTS ${_compiler_index})
endif()

foreach(_odb_component ${odb_FIND_COMPONENTS})
  set(_odb_lib "odb::${_odb_component}")
  if(NOT TARGET ${_odb_lib})
    string(TOUPPER "${_odb_lib}" _lib_upper)
    find_library(ODB_${_lib_upper}_LIBRARY odb-${_odb_component})
    if(NOT ODB_${_lib_upper}_LIBRARY AND odb_FIND_REQUIRED)
      #AWP: would be nicer to register all that was not found, then notify the error
      message(FATAL_ERROR "odb component not found: ${_odb_component}")
    endif()
    add_library("${_odb_lib}" UNKNOWN IMPORTED)
    set_target_properties(
        "${_odb_lib}"
        PROPERTIES
          IMPORTED_LOCATION "${ODB_${_lib_upper}_LIBRARY}"
    )
    unset(_component_link_libraries)
    list(APPEND _component_link_libraries "odb")
    string(COMPARE EQUAL "${_odb_component}" "sqlite" is_sqlite)
    string(COMPARE EQUAL "${_odb_component}" "pgsql" is_pgsql)
    if(is_sqlite)
      find_package(SQLite3 REQUIRED)
      list(APPEND _component_link_libraries "SQLite3")
    elseif(is_pgsql)
      find_package(PostgreSQL REQUIRED)
      list(APPEND _component_link_libraries "PostgreSQL::libpq")
    endif()

    set_target_properties(
        "${_odb_lib}"
        PROPERTIES
          INTERFACE_LINK_LIBRARIES "${_component_link_libraries}"
          INTERFACE_INCLUDE_DIRECTORIES "${ODB_INCLUDE_DIR}"
    )

    if(HUNTER_STATUS_DEBUG)
      get_target_property(_ilp "${_odb_lib}" INTERFACE_LINK_LIBRARIES)
      hunter_status_debug("${_odb_lib} INTERFACE_LINK_LIBRARIES - ${_ilp}")
      hunter_status_debug("${_odb_lib} at ${ODB_${_lib_upper}_LIBRARY}")
    endif()
  endif()
endforeach()

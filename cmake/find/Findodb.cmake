# ----------------------------------------------------------------------
# Findodb.cmake - odb CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# ----------------------------------------------------------------------
if(HUNTER_STATUS_DEBUG)
  message("[hunter] ODB_ROOT: ${ODB_ROOT}")
endif()

list(FIND CMAKE_FIND_ROOT_PATH "${ODB_ROOT}" _odb_root_index)
if(_odb_root_index EQUAL -1)
  list(APPEND CMAKE_FIND_ROOT_PATH "${ODB_ROOT}")
endif()

set(ODB_INCLUDE_DIRS "") 
find_path(
    ODB_INCLUDE_DIR 
      odb/core.hxx 
    PATHS
      "${ODB_ROOT}/include"
    NO_DEFAULT_PATH
)

if(HUNTER_STATUS_DEBUG)
  message("[hunter] ODB_INCLUDE_DIR: ${ODB_INCLUDE_DIR}")
endif()
list(APPEND ODB_INCLUDE_DIRS "${ODB_INCLUDE_DIR}") 
find_library(
    ODB_CORE_LIBRARY 
      odb
    PATHS
      "${ODB_ROOT}/lib"
    NO_DEFAULT_PATH
)

if(HUNTER_STATUS_DEBUG)
  message("[hunter] ODB_CORE_LIBRARY: ${ODB_CORE_LIBRARY}")
endif()

if(NOT TARGET "odb")
  if(NOT ODB_CORE_LIBRARY)
    message(FATAL_ERROR "odb not found!")
  endif()
  add_library("odb" UNKNOWN IMPORTED)
  set_target_properties(
      "odb"
      PROPERTIES 
      INTERFACE_INCLUDE_DIRECTORIES "${ODB_INCLUDE_DIR}"
      IMPORTED_LOCATION "${ODB_CORE_LIBRARY}"
  )
  get_filename_component(ODB_LIB_DIR "${ODB_CORE_LIBRARY}" DIRECTORY CACHE)
  if(HUNTER_STATUS_DEBUG)
    message("[hunter] odb at ${ODB_CORE_LIBRARY}")
  endif()
  set(ODB_FOUND TRUE)
endif()

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
    if(is_sqlite)
      find_package(SQLite3 REQUIRED)
      list(APPEND _component_link_libraries "SQLite3")    
    endif()

    set_target_properties(
        "${_odb_lib}"
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${_component_link_libraries}"
        INTERFACE_INCLUDE_DIRECTORIES "${ODB_INCLUDE_DIR}"
    )

  if(HUNTER_STATUS_DEBUG)
      get_target_property(_ilp "${_odb_lib}" INTERFACE_LINK_LIBRARIES)
      message("[hunter] ${_odb_lib} INTERFACE_LINK_LIBRARIES - ${_ilp}")
      message("[hunter] ${_odb_lib} at ${ODB_${_lib_upper}_LIBRARY}")
    endif()
  endif()
endforeach()

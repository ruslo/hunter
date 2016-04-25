# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(HUNTER_ENABLED)
  include(hunter_internal_error)
  include(hunter_status_debug)
else()
  function(hunter_internal_error)
    message(FATAL_ERROR ${ARGV})
  endfunction()

  function(hunter_status_debug)
    message(${ARGV})
  endfunction()
endif()

hunter_status_debug("Boost find config")

set(Boost_USE_STATIC_LIBS ON)
set(Boost_NO_BOOST_CMAKE YES)

find_package(Boost MODULE REQUIRED ${Boost_FIND_COMPONENTS})

get_filename_component(
    _root_path "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE
)

if(NOT TARGET "Boost::boost")
  add_library("Boost::boost" INTERFACE IMPORTED)
  set_target_properties(
      "Boost::boost"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${_root_path}/include"
  )
  if(MSVC)
    set_target_properties(
        "Boost::boost"
        PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "BOOST_ALL_NO_LIB=1"
    )
  endif()
endif()

foreach(_boost_component ${Boost_FIND_COMPONENTS})
  set(_boost_lib "Boost::${_boost_component}")
  if(NOT TARGET ${_boost_lib})
    add_library(${_boost_lib} STATIC IMPORTED)

    set_target_properties(
        ${_boost_lib} PROPERTIES INTERFACE_LINK_LIBRARIES "Boost::boost"
    )

    # Debug library
    string(TOUPPER "${_boost_component}" _lib_debug)
    set(_lib_debug "${Boost_${_lib_debug}_LIBRARY_DEBUG}")
    string(COMPARE EQUAL "${_lib_debug}" "" _is_empty)
    if(_is_empty)
      hunter_internal_error(
          "Variable not set: Boost_${_lib_debug}_LIBRARY_DEBUG"
      )
    endif()
    if(NOT EXISTS "${_lib_debug}")
      hunter_internal_error("Library not exists: ${_lib_debug}")
    endif()

    set_property(
        TARGET "${_boost_lib}" APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG
    )
    set_target_properties(
        "${_boost_lib}"
        PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
        IMPORTED_LOCATION_DEBUG "${_lib_debug}"
    )

    # Release library
    string(TOUPPER "${_boost_component}" _lib_release)
    set(_lib_release "${Boost_${_lib_release}_LIBRARY_RELEASE}")
    string(COMPARE EQUAL "${_lib_release}" "" _is_empty)
    if(_is_empty)
      hunter_internal_error(
          "Variable not set: Boost_${_lib_release}_LIBRARY_RELEASE"
      )
    endif()
    if(NOT EXISTS "${_lib_release}")
      hunter_internal_error("Library not exists: ${_lib_release}")
    endif()

    set_property(
        TARGET "${_boost_lib}" APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
    )
    set_target_properties(
        "${_boost_lib}"
        PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
        IMPORTED_LOCATION_RELEASE "${_lib_release}"
    )
  endif()
endforeach()

if(TARGET Boost::iostreams)
  include("${CMAKE_CURRENT_LIST_DIR}/BoostZLIBDependency.cmake" OPTIONAL)
  include("${CMAKE_CURRENT_LIST_DIR}/BoostBZip2Dependency.cmake" OPTIONAL)
endif()

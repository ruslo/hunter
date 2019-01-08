# Copyright (c) 2015, Aaditya Kalsi
# Copyright (c) 2016, 2019 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Manage dependencies:
# * boost.iostreams: ZLIB and BZIP2
# * boost.regex/boost.locale: ICU

include(hunter_add_package)
include(hunter_user_error)

include("${CMAKE_CURRENT_LIST_DIR}/../Hunter")

function(hunter_boost_component_b2_args compName boostCmakeArgs outList)
  hunter_assert_not_empty_string("${BOOST_VERSION}")

  string(TOUPPER ${compName} upperCompName)
  set(myList "") # empty

  set(is_common FALSE)
  set(is_iostreams FALSE)
  set(is_regex_locale FALSE)

  if(compName STREQUAL "iostreams")
    set(is_iostreams TRUE)
  elseif(compName STREQUAL "regex")
    set(is_regex_locale TRUE)
  elseif(compName STREQUAL "locale")
    set(is_regex_locale TRUE)
  else()
    set(is_common TRUE)
  endif()

  if(is_common)

    foreach(nvPair ${boostCmakeArgs})
      string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
      string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
      if(NOT is_same) # component build option found
        list(APPEND myList "-s" ${compNvPair})
      endif()
    endforeach()

    set("${outList}" ${myList} PARENT_SCOPE)

    return()

  endif()

  if(is_regex_locale)

    foreach(nvPair ${boostCmakeArgs})
      string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
      if(compNvPair STREQUAL nvPair)
        # nothing replaced, not a component we are looking for
        continue()
      endif()

      if(NOT compNvPair MATCHES "^HAS_ICU=")
        list(APPEND myList "-s" ${compNvPair})
        continue()
      endif()

      # 'compNvPair' has form 'HAS_ICU=xxx'
      string(REPLACE "=" ";" x "${compNvPair}")
      list(LENGTH x x_len)
      if(NOT x_len EQUAL 2)
        hunter_user_error("Unexpected HAS_ICU format: ${nvPair}")
      endif()

      list(GET x 1 has_icu)

      if(NOT has_icu)
        # No extra flags needed
        continue()
      endif()

      hunter_add_package(ICU)
      find_package(ICU CONFIG REQUIRED)

      list(APPEND myList "-s" "ICU_PATH=${ICU_ROOT}")
      set(icu_link)

      foreach(target i18n uc data)
        if(NOT TARGET ICU::${target})
          hunter_internal_error("Target not found: ICU::${target}")
        endif()

        get_target_property(path ICU::${target} IMPORTED_LOCATION_RELEASE)
        if(path)
          list(APPEND icu_link ${path})
          continue()
        endif()

        get_target_property(configs ICU::${target} IMPORTED_CONFIGURATIONS)
        if(NOT configs)
          hunter_internal_error("No ICU configurations")
        endif()
        list(GET configs 0 config)
        string(TOUPPER "${config}" config)
        get_target_property(path ICU::${target} IMPORTED_LOCATION_${config})
        if(NOT path)
          hunter_internal_error("No ICU library")
        endif()
        list(APPEND icu_link ${path})
      endforeach()

      if(NOT "${CMAKE_DL_LIBS}" STREQUAL "")
        list(APPEND icu_link "-l${CMAKE_DL_LIBS}")
      endif()

      string(REPLACE ";" " " icu_link "${icu_link}")

      set(
          CMAKE_EXE_LINKER_FLAGS
          "${icu_link} ${CMAKE_EXE_LINKER_FLAGS}"
          PARENT_SCOPE
      )
    endforeach()

    set("${outList}" ${myList} PARENT_SCOPE)
    return()

  endif()

  set(is_nocompress "0")
  set(is_nobzip2 "0")
  set(is_nozlib "0")

  foreach(nvPair ${boostCmakeArgs})
    string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
    string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
    if(NOT is_same) # iostreams build option found
      string(REPLACE "=" ";" optValue ${compNvPair})

      list(GET optValue 0 n)
      list(GET optValue 1 v)

      if(NOT is_nocompress)
        string(COMPARE EQUAL ${n} "NO_COMPRESSION" specified)
        if(specified AND v)
          set(is_nocompress "1")
        endif()
      endif()
      if(NOT is_nobzip2)
        string(COMPARE EQUAL ${n} "NO_BZIP2" specified)
        if(specified AND v)
          set(is_nobzip2 "1")
        endif()
      endif()
      if(NOT is_nozlib)
        string(COMPARE EQUAL ${n} "NO_ZLIB" specified)
        if(specified AND v)
          set(is_nozlib "1")
        endif()
      endif()

    endif()
  endforeach()

  list(APPEND myList "-s" "NO_COMPRESSION=${is_nocompress}")

  if(NOT is_nozlib)
    list(APPEND myList "-s" "NO_ZLIB=0")
  else()
    list(APPEND myList "-s" "NO_ZLIB=1")
  endif()

  if(NOT is_nobzip2)
    list(APPEND myList "-s" "NO_BZIP2=0")
  else()
    list(APPEND myList "-s" "NO_BZIP2=1")
  endif()

  if(NOT is_nocompress)
    if(NOT is_nozlib)
      # download ZLIB and set ZLIB_INCLUDE, ZLIB_LIBPATH
      hunter_add_package(ZLIB)
      find_package(ZLIB REQUIRED CONFIG)
      get_target_property(zlib_include ZLIB::zlib INTERFACE_INCLUDE_DIRECTORIES)
      get_target_property(zlib_path ZLIB::zlib IMPORTED_LOCATION_RELEASE)
      if(NOT zlib_path)
        get_target_property(zlib_configurations ZLIB::zlib IMPORTED_CONFIGURATIONS)
        if(NOT zlib_configurations)
          hunter_internal_error("No ZLIB configurations")
        endif()
        list(GET zlib_configurations 0 config)
        string(TOUPPER "${config}" config)
        get_target_property(zlib_path ZLIB::zlib IMPORTED_LOCATION_${config})
        if(NOT zlib_path)
          hunter_internal_error("No ZLIB library")
        endif()
      endif()
      get_filename_component(zlib_dir ${zlib_path} DIRECTORY)
      get_filename_component(zlib_name ${zlib_path} NAME_WE)
      if(NOT WIN32 OR MINGW)
        string(REGEX REPLACE "^lib" "" zlib_name ${zlib_name})
      endif()
      list(APPEND myList "-s" "ZLIB_INCLUDE=${zlib_include}" "-s" "ZLIB_LIBPATH=${zlib_dir}" "-s" "ZLIB_BINARY=${zlib_name}")
      set(BOOST_CONFIG_LINK_ZLIB 1 PARENT_SCOPE)
    endif()

    if(NOT is_nobzip2)
      # download BZIP2 and set BZIP2_INCLUDE, BZIP2_LIBPATH
      hunter_add_package(BZip2)
      find_package(BZip2 REQUIRED CONFIG)
      get_target_property(bzip2_include BZip2::bz2 INTERFACE_INCLUDE_DIRECTORIES)
      get_target_property(bzip2_path BZip2::bz2 IMPORTED_LOCATION_RELEASE)
      if(NOT bzip2_path)
        get_target_property(bzip2_configurations BZip2::bz2 IMPORTED_CONFIGURATIONS)
        if(NOT bzip2_configurations)
          hunter_internal_error("No BZip2 configurations")
        endif()
        list(GET bzip2_configurations 0 config)
        string(TOUPPER "${config}" config)
        get_target_property(bzip2_path BZip2::bz2 IMPORTED_LOCATION_${config})
        if(NOT bzip2_path)
          hunter_internal_error("No BZip2 library")
        endif()
      endif()
      get_filename_component(bzip2_dir ${bzip2_path} DIRECTORY)
      get_filename_component(bzip2_name ${bzip2_path} NAME_WE)
      if(NOT WIN32 OR MINGW)
        string(REGEX REPLACE "^lib" "" bzip2_name ${bzip2_name})
      endif()
      list(APPEND myList "-s" "BZIP2_INCLUDE=${bzip2_include}" "-s" "BZIP2_LIBPATH=${bzip2_dir}" "-s" "BZIP2_BINARY=${bzip2_name}")
      set(BOOST_CONFIG_LINK_BZIP2 1 PARENT_SCOPE)
    endif()

  endif()

  set("${outList}" ${myList} PARENT_SCOPE)

endfunction()

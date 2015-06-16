# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# for iostreams dependency on ZLIB and BZIP2
include(hunter_add_package)
include("${CMAKE_CURRENT_LIST_DIR}/../Hunter")

function(hunter_boost_component_b2_args compName boostCmakeArgs outList)
  string(TOUPPER ${compName} upperCompName)
  set(myList "")#empty

  string(COMPARE EQUAL "${compName}" "iostreams" is_iostreams)

  if(NOT is_iostreams)

    foreach(nvPair ${boostCmakeArgs})
      string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
      string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
      if(NOT is_same)#component build option found
        list(APPEND myList "-s" ${compNvPair})
      endif()
    endforeach()

  else()# iostreams args

    set(is_nocompress "0")
    set(is_nobzip2 "0")
    set(is_nozlib "0")

    foreach(nvPair ${boostCmakeArgs})
      string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
      string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
      if(NOT is_same)#iostreams build option found
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
        get_target_property(zlib_release ZLIB::zlib IMPORTED_LOCATION_RELEASE)
        get_filename_component(zlib_path ${zlib_release} DIRECTORY)
        get_filename_component(zlib_name ${zlib_release} NAME_WE)
        if(NOT WIN32)
          string(REPLACE "lib" "" zlib_name ${zlib_name})
        endif()
        list(APPEND myList "-s" "ZLIB_INCLUDE=${zlib_include}" "-s" "ZLIB_LIBPATH=${zlib_path}" "-s" "ZLIB_BINARY=${zlib_name}")
        set(BOOST_CONFIG_LINK_ZLIB 1 PARENT_SCOPE)
      endif()

      if(NOT is_nobzip2)
        # download BZIP2 and set BZIP2_INCLUDE, BZIP2_LIBPATH
        hunter_add_package(BZip2)
        find_package(BZip2 REQUIRED CONFIG)
        get_target_property(bzip2_include BZip2::bz2 INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(bzip2_release BZip2::bz2 IMPORTED_LOCATION_RELEASE)
        get_filename_component(bzip2_path ${bzip2_release} DIRECTORY)
        get_filename_component(bzip2_name ${bzip2_release} NAME_WE)
        if(NOT WIN32)
          string(REPLACE "lib" "" bzip2_name ${bzip2_name})
        endif()
        list(APPEND myList "-s" "BZIP2_INCLUDE=${bzip2_include}" "-s" "BZIP2_LIBPATH=${bzip2_path}" "-s" "BZIP2_BINARY=${bzip2_name}")
        set(BOOST_CONFIG_LINK_BZIP2 1 PARENT_SCOPE)
      endif()

    endif(NOT is_nocompress)

  endif(NOT is_iostreams)

  set("${outList}" ${myList} PARENT_SCOPE)

endfunction(hunter_boost_component_b2_args)

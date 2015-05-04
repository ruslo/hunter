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
        list(APPEND myList "-s" "${compNvPair}")
      endif()
    endforeach()
  else()# iostreams args
    set(is_nocompress 0)
    set(is_nobzip 0)
    set(no_zlib 0)
    foreach(nvPair ${boostCmakeArgs})
      string(REPLACE "${upperCompName}_" "" compNvPair ${nvPair})
      string(COMPARE EQUAL ${compNvPair} ${nvPair} is_same)
      if(NOT is_same)#iostreams build option found
        string(REPLACE "=" ";" optValue ${compNvPair})

        list(GET optValue 0 n)
        list(GET optValue 1 v)

        if(NOT is_nocompress)
          string(COMPARE EQUAL ${n} "NO_COMPRESSION" is_nocompress)
          if(is_nocompress)
            set(is_nocompress ${v})
          endif()
        endif()
        if(NOT is_nobzip)
          string(COMPARE EQUAL ${n} "NO_BZIP2" is_nobzip)
          if(is_nobzip)
            set(is_nobzip ${v})
          endif()
        endif()
        if(NOT is_nozlib)
          string(COMPARE EQUAL ${n} "NO_ZLIB" is_nozlib)
          if(is_nozlib)
            set(is_nozlib ${v})
          endif()
        endif()

        list(APPEND myList "-s" "${compNvPair}")
      endif()
    endforeach()
    if(NOT is_nocompress)
      if(NOT is_nozlib)
        # download ZLIB and set ZLIB_INCLUDE, ZLIB_LIBPATH
        hunter_add_package(ZLIB)
        find_package(ZLIB REQUIRED CONFIG)
        get_target_property(zlib_include ZLIB::zlib INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(zlib_release ZLIB::zlib IMPORTED_LOCATION_RELEASE)
        list(APPEND myList -s "ZLIB_INCLUDE=${zlib_include}" -s "ZLIB_LIBPATH=${zlib_release}")
      endif()
      if(NOT is_nobzip)
        # download BZIP2 and set BZIP2_INCLUDE, BZIP2_LIBPATH
        hunter_add_package(BZip2)
        find_package(BZip2 REQUIRED CONFIG)
        get_target_property(bzip2_include BZip2::bz2 INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(bzip2_release BZip2::bz2 IMPORTED_LOCATION_RELEASE)
        list(APPEND build_opts -s "BZIP2_INCLUDE=${bzip2_include}" -s "BZIP2_LIBPATH=${bzip2_release}")
      endif()
    endif(NOT is_nocompress)
  endif(NOT is_iostreams)

  set("${outList}" ${myList} PARENT_SCOPE)
endfunction(hunter_boost_component_b2_args)

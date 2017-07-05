# FindLive555
#
# Find the Live555 Streaming Media Libraries.
#
#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
# Copyright 2009-2011 Mathieu Malaterre <mathieu.malaterre@gmail.com>
# Copyright 2015 Alexander Lamaison <alexander.lamaison@gmail.com>
# Copyright 2017 Ernesto Varoli <ernesto.varoli@gmail.com>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

if(HUNTER_STATUS_DEBUG)
  message("[hunter] Custom FindLive555 module")
endif()

# Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
if(LIVE555_USE_STATIC_LIBS)
  set(_live555_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
  if(WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else()
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a )
  endif()
endif()

find_path(LIVE555_GROUPSOCK_INCLUDE_DIR
  NAMES
    Groupsock.hh
  HINTS
    "${LIVE555_ROOT}"
  PATH_SUFFIXES
    groupsock
)

find_path(LIVE555_LIVEMEDIA_INCLUDE_DIR
  NAMES
    liveMedia.hh
  HINTS
    "${LIVE555_ROOT}"
  PATH_SUFFIXES
    liveMedia
)

find_path(LIVE555_USAGEENVIRONMENT_INCLUDE_DIR
  NAMES
    UsageEnvironment.hh
  HINTS
    "${LIVE555_ROOT}"
  PATH_SUFFIXES
    UsageEnvironment
)

find_path(LIVE555_BASICUSAGEENVIRONMENT_INCLUDE_DIR
  NAMES
    BasicUsageEnvironment.hh
  HINTS
    "${LIVE555_ROOT}"
  PATH_SUFFIXES
    BasicUsageEnvironment
)

if(WIN32 AND NOT CYGWIN)
  # TODO
else()

  find_library(LIVE555_BASICUSAGEENVIRONMENT_LIBRARY
    NAMES
      BasicUsageEnvironment
    HINTS
      "${LIVE555_ROOT}"
    PATH_SUFFIXES
      lib
  )

  find_library(LIVE555_USAGEENVIRONMENT_LIBRARY
    NAMES
      UsageEnvironment
    HINTS
      "${LIVE555_ROOT}"
    PATH_SUFFIXES
      lib
  )

  find_library(LIVE555_GROUPSOCK_LIBRARY
    NAMES
      groupsock
    HINTS
      "${LIVE555_ROOT}"
    PATH_SUFFIXES
      lib
  )

  find_library(LIVE555_LIVEMEDIA_LIBRARY
    NAMES
      liveMedia
    HINTS
      "${LIVE555_ROOT}"
    PATH_SUFFIXES
      lib
  )

  mark_as_advanced(LIVE555_BASICUSAGEENVIRONMENT_LIBRARY LIVE555_USAGEENVIRONMENT_LIBRARY LIVE555_GROUPSOCK_LIBRARY LIVE555_LIVEMEDIA_LIBRARY)

  # compat defines
  set(LIVE555_BASICUSAGEENVIRONMENT_LIBRARIES ${LIVE555_BASICUSAGEENVIRONMENT_LIBRARY} ${CMAKE_DL_LIBS})
  set(LIVE555_USAGEENVIRONMENT_LIBRARIES ${LIVE555_USAGEENVIRONMENT_LIBRARY} ${CMAKE_DL_LIBS})
  set(LIVE555_LIVEMEDIA_LIBRARIES ${LIVE555_LIVEMEDIA_LIBRARY} ${CMAKE_DL_LIBS})
  set(LIVE555_GROUPSOCK_LIBRARIES ${LIVE555_GROUPSOCK_LIBRARY} ${CMAKE_DL_LIBS})

  set(LIVE555_LIBRARIES ${LIVE555_LIVEMEDIA_LIBRARY} ${LIVE555_GROUPSOCK_LIBRARY} ${LIVE555_USAGEENVIRONMENT_LIBRARY} ${LIVE555_BASICUSAGEENVIRONMENT_LIBRARY} ${CMAKE_DL_LIBS})

endif()

function(getLiveVersion library_name library_version_ret)
  string(TOUPPER ${library_name} uc_library_name)
  set(library_version_define "${uc_library_name}_LIBRARY_VERSION_INT")
  set(library_include_dir "${LIVE555_${uc_library_name}_INCLUDE_DIR}")

  if(EXISTS "${library_include_dir}/${library_name}_version.hh")
    file(STRINGS "${library_include_dir}/${library_name}_version.hh" library_version_str
      REGEX "^#[\t ]*define[\t ]+${library_version_define}[\t ]+([0-9])+.*")
    string(COMPARE EQUAL "${library_version_str}" "" _is_empty)
    if(_is_empty)
      message(
          FATAL_ERROR
          "Incorrect ${library_version_define} define in header"
          ": ${library_include_dir}/${library_name}_version.hh"
      )
    endif()

    string(REGEX REPLACE "^.*${library_version_define}[\t ]+([0-9]+).*$"
      "\\1" library_version "${library_version_str}" )
    set(${library_version_ret} ${library_version} PARENT_SCOPE)
  endif()

endfunction()

getLiveVersion("liveMedia" LIVEMEDIA_VERSION)
getLiveVersion("BasicUsageEnvironment" BASICUSAGEENVIRONMENT_VERSION)
getLiveVersion("UsageEnvironment" USAGEENVIRONMENT_VERSION)
getLiveVersion("groupsock" GROUPSOCK_VERSION)

include(FindPackageHandleStandardArgs)

if( NOT (LIVEMEDIA_VERSION EQUAL GROUPSOCK_VERSION AND BASICUSAGEENVIRONMENT_VERSION EQUAL USAGEENVIRONMENT_VERSION AND USAGEENVIRONMENT_VERSION EQUAL LIVEMEDIA_VERSION))
  message(
          FATAL_ERROR
          "Incorrect libraries versions:
          \tliveMedia: ${LIVEMEDIA_VERSION}
          \tBasicUsageEnvironment: ${BASICUSAGEENVIRONMENT_VERSION}
          \tUsageEnvironment: ${USAGEENVIRONMENT_VERSION}
          \tgroupsock ${GROUPSOCK_VERSION}"
      )
else()
  set(LIVE555_VERSION ${LIVEMEDIA_VERSION})
endif()

if (LIVE555_VERSION)
  find_package_handle_standard_args(Live555
    REQUIRED_VARS
      LIVE555_LIBRARIES
      LIVE555_LIVEMEDIA_INCLUDE_DIR
      LIVE555_GROUPSOCK_INCLUDE_DIR
      LIVE555_USAGEENVIRONMENT_INCLUDE_DIR
      LIVE555_BASICUSAGEENVIRONMENT_INCLUDE_DIR
    VERSION_VAR
      LIVE555_VERSION
    FAIL_MESSAGE
      "Could NOT find Live555 Streaming Media, try to set the path to Live555 root folder in the system variable LIVE555_ROOT_DIR"
  )
else ()
  find_package_handle_standard_args(Live555 "Could NOT find Live555 Streaming Media, try to set the path to Live555 root folder in the system variable LIVE_ROOT_DIR"
    LIVE555_LIBRARIES
    LIVE555_LIVEMEDIA_INCLUDE_DIR
    LIVE555_GROUPSOCK_INCLUDE_DIR
    LIVE555_USAGEENVIRONMENT_INCLUDE_DIR
    LIVE555_BASICUSAGEENVIRONMENT_INCLUDE_DIR
  )
endif ()

mark_as_advanced(LIVE555_LIVEMEDIA_INCLUDE_DIR
                 LIVE555_GROUPSOCK_INCLUDE_DIR
                 LIVE555_USAGEENVIRONMENT_INCLUDE_DIR
                 LIVE555_BASICUSAGEENVIRONMENT_INCLUDE_DIR
                 LIVE555_LIBRARIES)

function(addLiveLibrary library_name)
  string(TOUPPER ${library_name} uc_library_name)
  if(NOT TARGET Live555::${library_name} AND 
     EXISTS "${LIVE555_${uc_library_name}_LIBRARY}")
    add_library(Live555::${library_name} UNKNOWN IMPORTED)
    set_target_properties(Live555::${library_name} PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LIVE555_${uc_library_name}_INCLUDE_DIR}")
    set_target_properties(Live555::${library_name} PROPERTIES
        INTERFACE_LINK_LIBRARIES "${CMAKE_DL_LIBS}")
    if(EXISTS "${LIVE555_${uc_library_name}_LIBRARY}")
      set_target_properties(Live555::${library_name} PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES "C++"
        IMPORTED_LOCATION "${LIVE555_${uc_library_name}_LIBRARY}")
    endif()
  endif()
endfunction()

if(LIVE555_FOUND)
  addLiveLibrary("LiveMedia")
  addLiveLibrary("Groupsock")
  addLiveLibrary("UsageEnvironment")
  addLiveLibrary("BasicUsageEnvironment")
endif()

# Restore the original find library ordering
if(LIVE555_USE_STATIC_LIBS)
  set(CMAKE_FIND_LIBRARY_SUFFIXES ${_live555_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
endif()

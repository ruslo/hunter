# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# Findtao-pegtl
# -------
#
# Finds the tao-pegtl library
#
# This will define the following variables::
#
#   tao-pegtl_FOUND    - True if the system has the tao-pegtl library
#   tao-pegtl_VERSION  - The version of the tao-pegtl library which was found
#
# and the following imported targets::
#
#   tao::pegtl   - The tao-pegtl library

find_path(tao-pegtl_INCLUDE_DIR
  NAMES pegtl.hpp
  PATHS ${tao-pegtl_ROOT}/include
  PATH_SUFFIXES tao
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(tao-pegtl
  FOUND_VAR tao-pegtl_FOUND
  REQUIRED_VARS
    tao-pegtl_INCLUDE_DIR
)

if(tao-pegtl_FOUND)
  set(tao-pegtl_INCLUDE_DIRS ${tao-pegtl_INCLUDE_DIR})
endif()

if(tao-pegtl_FOUND AND NOT TARGET tao::pegtl)
  add_library(tao::pegtl UNKNOWN IMPORTED)
  set_target_properties(tao::pegtl PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${tao-pegtl_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(
  tao-pegtl_INCLUDE_DIR
)

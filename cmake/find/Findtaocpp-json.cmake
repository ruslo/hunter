# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# Findtaocpp-json
# -------
#
# Finds the taocpp-json library
#
# This will define the following variables::
#
#   taocpp-json_FOUND    - True if the system has the taocpp-json library
#   taocpp-json_VERSION  - The version of the taocpp-json library which was found
#
# and the following imported targets::
#
#   taocpp::json   - The taocpp-json library

find_path(taocpp-json_INCLUDE_DIR
  NAMES json.hpp
  PATHS ${taocpp-json_ROOT}/include
  PATH_SUFFIXES tao
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(taocpp-json
  FOUND_VAR taocpp-json_FOUND
  REQUIRED_VARS
    taocpp-json_INCLUDE_DIR
)

if(taocpp-json_FOUND)
  set(taocpp-json_INCLUDE_DIRS ${taocpp-json_INCLUDE_DIR})
endif()

if(taocpp-json_FOUND AND NOT TARGET taocpp::json)
  add_library(taocpp::json UNKNOWN IMPORTED)
  set_target_properties(taocpp::json PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${taocpp-json_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(
  taocpp-json_INCLUDE_DIR
)

# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(NOT TARGET Eigen::eigen)
  add_library(Eigen::eigen INTERFACE IMPORTED)
  set_target_properties(
      Eigen::eigen
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${HUNTER_INSTALL_PREFIX}/include/eigen3"
  )
endif()

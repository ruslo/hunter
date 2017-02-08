# Copyright (c) 2015-2016, University College London
# All rights reserved.
if(NOT F2C_FOUND)
  find_path(F2C_INCLUDE_DIR NAMES f2c.h)
  find_library(F2C_LIBRARY NAMES libf2c.a f2c)

  set(F2C_INCLUDE_DIRS ${F2C_INCLUDE_DIR})
  set(F2C_LIBRARIES ${F2C_LIBRARY})

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(F2C REQUIRED_VARS F2C_INCLUDE_DIR F2C_LIBRARY)
endif()

if(F2C_FOUND)
  if(F2C_LIBRARY MATCHES "\\.a$")
    add_library(f2c::f2c STATIC IMPORTED GLOBAL)
  else()
    add_library(f2c::f2c SHARED IMPORTED GLOBAL)
  endif()
  set_target_properties(f2c::f2c PROPERTIES
    IMPORTED_LOCATION "${F2C_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${F2C_INCLUDE_DIR}"
  )
endif()

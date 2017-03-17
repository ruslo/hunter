# ----------------------------------------------------------------------
# FindSQLite3.cmake - SQLite3 CMake module
#
# Copyright (C) 2015 Alexandre Pretyman. All rights reserved.
#
# ----------------------------------------------------------------------

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("SQLITE3_ROOT: ${SQLITE3_ROOT}")

find_path(
    SQLITE3_INCLUDE_DIR
      sqlite3.h
    PATHS
      "${SQLITE3_ROOT}/include"
    NO_DEFAULT_PATH
)

hunter_status_debug("SQLITE3_INCLUDE_DIR: ${SQLITE3_INCLUDE_DIR}")

find_library(
    SQLITE3_LIBRARY
      sqlite3
    PATHS
      "${SQLITE3_ROOT}/lib"
    NO_DEFAULT_PATH
)

hunter_status_debug("SQLITE3_LIBRARY: ${SQLITE3_LIBRARY}")

if(NOT TARGET "SQLite3")
  if(SQLITE3_INCLUDE_DIR AND SQLITE3_LIBRARY)
    set(SQLITE3_FOUND TRUE)
    add_library("SQLite3" UNKNOWN IMPORTED)
    set_target_properties("SQLite3"
        PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${SQLITE3_INCLUDE_DIR}"
          IMPORTED_LOCATION "${SQLITE3_LIBRARY}"
    )
    get_filename_component(
        SQLITE3_LIB_DIR
          "${SQLITE3_LIBRARY}"
        DIRECTORY CACHE
    )

    if(UNIX AND NOT APPLE AND NOT ANDROID) # if Linux
      string(REGEX MATCH "\\.a$" _ends_in_dot_a "${SQLITE3_LIBRARY}")
      string(COMPARE NOTEQUAL "${_ends_in_dot_a}" "" _sqlite_is_static)
      if(_sqlite_is_static)
        # when static linking we need to add pthread and dl libraries
        find_package(Threads REQUIRED)
        list(APPEND _sqlite3_static_library_dependencies Threads::Threads ${CMAKE_DL_LIBS})
        set_target_properties("SQLite3"
            PROPERTIES
              INTERFACE_LINK_LIBRARIES "${_sqlite3_static_library_dependencies}"
        )
      endif()
    endif()
  elseif(SQLite3_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find SQLite3")
  endif()
endif()

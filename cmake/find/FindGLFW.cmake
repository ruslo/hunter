# ----------------------------------------------------------------------
# Findodb.cmake - odb CMake module
#
# Copyright (C) 2016 Alexandre Pretyman. All rights reserved.
#
# Defines GLFW target if found
#
# ----------------------------------------------------------------------



if(TARGET "GLFW")
  return()
endif()

hunter_status_debug("GLFW_ROOT: ${GLFW_ROOT}")

find_path(
  GLFW_INCLUDE_DIR
    NAMES
      GLFW/glfw3.h
    PATHS
    "${GLFW_ROOT}/include"
    NO_DEFAULT_PATH
)
set(GLFW_FOUND FALSE)
find_library(
    GLFW_LIBRARY
      glfw3
    PATHS
      "${GLFW_ROOT}/lib"
    NO_DEFAULT_PATH
)
if(GLFW_LIBRARY)
  unset(_glfw_dependencies)
  if(APPLE)
    list(APPEND _glfw_dependencies "-framework Cocoa")
    list(APPEND _glfw_dependencies "-framework CoreVideo")
    list(APPEND _glfw_dependencies "-framework IOKit")
    list(APPEND _glfw_dependencies "-framework OpenGL")
  elseif(UNIX) # linux 
    find_package(OpenGL REQUIRED)
    list(APPEND _glfw_dependencies "${OPENGL_gl_LIBRARY}")

    #Below taken from https://github.com/PixarAnimationStudios/OpenSubdiv/blob/master/cmake/FindGLFW.cmake
    find_package(X11 REQUIRED)
    if(NOT X11_Xrandr_FOUND)
      message(FATAL_ERROR "Xrandr library not found - required for GLFW")
    endif()
    if(NOT X11_xf86vmode_FOUND)
      message(FATAL_ERROR "xf86vmode library not found - required for GLFW")
    endif()
    if(NOT X11_Xcursor_FOUND)
      message(FATAL_ERROR "Xcursor library not found - required for GLFW")
    endif()
    if(NOT X11_Xinerama_FOUND)
      message(FATAL_ERROR "Xinerama library not found - required for GLFW")
    endif()
    list(APPEND _glfw_dependencies
        "${X11_X11_LIB}"
        "${X11_Xxf86vm_LIB}"
        "${X11_Xcursor_LIB}"
        "${X11_Xinerama_LIB}"
        "${X11_Xrandr_LIB}"
    )

    find_package(Threads REQUIRED)
    list(APPEND _glfw_dependencies "${CMAKE_THREAD_LIBS_INIT}")
    list(APPEND _glfw_dependencies -lrt -ldl -lm)
  endif()
  add_library("GLFW" UNKNOWN IMPORTED)
  set_target_properties(
      "GLFW"
      PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${GLFW_INCLUDE_DIR}"
        IMPORTED_LOCATION "${GLFW_LIBRARY}"
        INTERFACE_LINK_LIBRARIES "${_glfw_dependencies}"
  )
  set(GLFW_FOUND TRUE)
elseif(GLFW_FIND_REQUIRED)
  message(FATAL_ERROR "GLFW not found")
endif()


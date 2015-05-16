#.rst:
# FindPNG
# -------
#
# Find the native PNG includes and library
#
#
#
# This module searches libpng, the library for working with PNG images.
#
# It defines the following variables
#
# ``PNG_INCLUDE_DIRS``
#   where to find png.h, etc.
# ``PNG_LIBRARIES``
#   the libraries to link against to use PNG.
# ``PNG_DEFINITIONS``
#   You should add_definitons(${PNG_DEFINITIONS}) before compiling code
#   that includes png library files.
# ``PNG_FOUND``
#   If false, do not try to use PNG.
# ``PNG_VERSION_STRING``
#   the version of the PNG library found (since CMake 2.8.8)
#
# Also defined, but not for general use are
#
# ``PNG_LIBRARY``
#   where to find the PNG library.
#
# For backward compatiblity the variable PNG_INCLUDE_DIR is also set.
# It has the same value as PNG_INCLUDE_DIRS.
#
# Since PNG depends on the ZLib compression library, none of the above
# will be defined unless ZLib can be found.

#=============================================================================
# Copyright 2002-2009 Kitware, Inc.
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
  message("[hunter] Custom FindPNG module")
endif()

find_package(PNG CONFIG)

set(PNG_LIBRARY PNG::png)
set(PNG_LIBRARIES ${PNG_LIBRARY})

set(PNG_INCLUDE_DIR "${PNG_ROOT}/include")
set(PNG_INCLUDE_DIRS "${PNG_INCLUDE_DIR}")

set(PNG_DEFINITIONS "")

file(STRINGS "${PNG_INCLUDE_DIR}/png.h" png_version_str REGEX "^#define[ \t]+PNG_LIBPNG_VER_STRING[ \t]+\".+\"")
string(REGEX REPLACE "^#define[ \t]+PNG_LIBPNG_VER_STRING[ \t]+\"([^\"]+)\".*" "\\1" PNG_VERSION_STRING "${png_version_str}")

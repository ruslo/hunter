# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    magnum
    VERSION
    2019.01
    URL
    "https://github.com/mosra/magnum/archive/v2019.01.tar.gz"
    SHA1
    af356adc9e83826d55bd7f438c29f98104f95fd0
)

# CMAKE_SYSTEM_NAME dependant default options below

# Take all the plugins
set(_hunter_magnum_cmake_args
    WITH_ANYIMAGECONVERTER=ON
    WITH_ANYIMAGEIMPORTER=ON
    WITH_ANYSCENEIMPORTER=ON
    WITH_MAGNUMFONT=ON
    WITH_MAGNUMFONTCONVERTER=ON
    WITH_OBJIMPORTER=ON
    WITH_TGAIMAGECONVERTER=ON
    WITH_TGAIMPORTER=ON)

# Default application implementation
if(ANDROID)
    list(APPEND _hunter_magnum_cmake_args WITH_ANDROIDAPPLICATION=ON)
elseif(NOT IOS)
    # TODO: There's no SDL2 for iOS?
    list(APPEND _hunter_magnum_cmake_args WITH_SDL2APPLICATION=ON)
endif()

# Command-line utilities for desktop platforms
if(WIN32 OR UNIX)
    list(APPEND _hunter_magnum_cmake_args
        WITH_GL_INFO=ON
        WITH_DISTANCEFIELDCONVERTER=ON
        WITH_FONTCONVERTER=ON
        WITH_IMAGECONVERTER=ON
        WITH_OPENGLTESTER=ON)
endif()

# Windows-specific
if(WIN32)
    list(APPEND _hunter_magnum_cmake_args
        WITH_WINDOWLESSWGLAPPLICATION=ON
        WITH_WGLCONTEXT=ON)
endif()

# Linux-specific
if(UNIX AND NOT APPLE)
    list(APPEND _hunter_magnum_cmake_args
        WITH_WINDOWLESSGLXAPPLICATION=ON
        WITH_GLXCONTEXT=ON)
endif()

# macOS-specific
if(APPLE AND NOT IOS)
    list(APPEND _hunter_magnum_cmake_args
        WITH_WINDOWLESSCGLAPPLICATION=ON
        WITH_CGLCONTEXT=ON)
endif()

# iOS-specific
if(IOS)
    list(APPEND _hunter_magnum_cmake_args
        WITH_WINDOWLESSIOSAPPLICATION=ON
        WITH_EGLCONTEXT=ON)
endif()

# Emscripten-specific. No EglContext here.
if(EMSCRIPTEN)
    list(APPEND _hunter_magnum_cmake_args
        WITH_WINDOWLESSEGLAPPLICATION=ON)
endif()

# Audio, where supported.
# - Linux and macOS has it
# - OpenAL hunter package fails to build under windows
#   See https://ci.appveyor.com/project/pthom/hunter/builds/20697140/job/03xop04ea11c47vf
#   CMake Error at C:/projects/hunter/_ci/cmake/share/cmake-3.13/Modules/CheckIncludeFiles.cmake:63 (message):
#   Unknown arguments:
#   -D_WIN32_WINNT=0x0502
# - Audio / OpenAL not ported to Android yet
if((UNIX OR EMSCRIPTEN) AND NOT IOS)
    list(APPEND _hunter_magnum_cmake_args
        WITH_AUDIO=ON
        WITH_WAVAUDIOIMPORTER=ON
        WITH_ANYAUDIOIMPORTER=ON)

    # Also the magnum-al-info for desktop platforms
    if(UNIX)
        list(APPEND _hunter_magnum_cmake_args WITH_AL_INFO=ON)
    endif()
endif()

hunter_cmake_args(
    magnum
    CMAKE_ARGS
    ${_hunter_magnum_cmake_args}
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(magnum)
hunter_download(PACKAGE_NAME magnum)

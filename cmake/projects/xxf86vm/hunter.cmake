# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib
hunter_add_version(
    PACKAGE_NAME
    xxf86vm
    VERSION
    "1.1.2"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXxf86vm-1.1.2.tar.bz2"
    SHA1
    57bbf3bb69a49f6a6dec515813394a383f85502f
)

hunter_configuration_types(xxf86vm CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xxf86vm_dependencies
    xorg-macros
    xproto
    x11
    xextproto
    xext
    xf86vidmodeproto
)
hunter_cmake_args(
    xxf86vm
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xxf86vm_dependencies}
)
hunter_cacheable(xxf86vm)
hunter_download(
    PACKAGE_NAME xxf86vm
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXxf86vm.la"
    "lib/pkgconfig/xxf86vm.pc"
)

# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# https://xcb.freedesktop.org/dist/
hunter_add_version(
    PACKAGE_NAME
    xcb
    VERSION
    "1.11.1"
    URL
    "https://xcb.freedesktop.org/dist/libxcb-1.11.1.tar.bz2"
    SHA1
    28e47aa699d2c2cffed31d1aa2473a9fefe77f17
)


# http://www.x.org/releases/X11R7.7/src/xcb/
hunter_add_version(
    PACKAGE_NAME
    xcb
    VERSION
    "1.8.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/xcb/libxcb-1.8.1.tar.bz2"
    SHA1
    98199b6054750a06cddd4e77baa4354af547ce6f
)

set(_xcb_text_files "")
foreach(_x composite damage dpms dri2 dri3 glx present randr record render res screensaver shape shm sync xevie xf86dri xfixes xinerama xkb xprint xtest xv xvmc)
  list(APPEND _xcb_text_files "lib/libxcb-${_x}.la" "lib/pkgconfig/xcb-${_x}.pc")
endforeach()

list(APPEND _xcb_text_files "lib/libxcb.la" "lib/pkgconfig/xcb.pc")

hunter_pick_scheme(DEFAULT xcb)
hunter_cacheable(xcb)
hunter_download(
    PACKAGE_NAME xcb
    PACKAGE_UNRELOCATABLE_TEXT_FILES "${_xcb_text_files}"
)

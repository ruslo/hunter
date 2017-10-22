string(COMPARE EQUAL "${CMAKE_SYSTEM_NAME}" "Linux" is_linux)

if(is_linux)
  set(
      dependencies
      drm
      glib
      gst_plugins_bad
      gst_plugins_base
      gst_plugins_good
      gst_plugins_ugly
      gstreamer
      ice
      libffi
      libogg
      libpcre
      pciaccess
      sm
      util_linux
      x11
      xau
      xcb
      xcursor
      xdamage
      xext
      xfixes
      xi
      xinerama
      xrandr
      xrender
      xshmfence
      xxf86vm
  )
  foreach(pkg ${dependencies})
    hunter_config(
        ${pkg}
        VERSION ${HUNTER_${pkg}_VERSION}
        CMAKE_ARGS BUILD_SHARED_LIBS=ON
    )
  endforeach()

  hunter_config(
      Qt
      VERSION ${HUNTER_Qt_VERSION}
      CMAKE_ARGS
      QT_WITH_GSTREAMER=ON
      BUILD_SHARED_LIBS=ON
  )
endif()

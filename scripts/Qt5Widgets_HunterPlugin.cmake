# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(NOT TARGET Qt5::Widgets)
  message(FATAL_ERROR "Expected target Qt5::Widgets")
endif()

string(COMPARE EQUAL "${_qt5Widgets_install_prefix}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR "Variable not set: _qt5Widgets_install_prefix")
endif()

if(NOT EXISTS "${_qt5Widgets_install_prefix}")
  message(
      FATAL_ERROR
      "Directory not exists: ${_qt5Widgets_install_prefix}"
      " (variable _qt5Widgets_install_prefix)"
  )
endif()

if(NOT IS_DIRECTORY "${_qt5Widgets_install_prefix}")
  message(
      FATAL_ERROR
      "Is not directory: ${_qt5Widgets_install_prefix}"
      " (variable _qt5Widgets_install_prefix)"
  )
endif()

# Add library, framework or link flags
function(_hunter_plugin_add_interface target lib)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)

  set_target_properties(
      ${target}
      PROPERTIES
      INTERFACE_LINK_LIBRARIES "${lib};${linked_libs}"
  )
endfunction()

function(_hunter_plugin_add_interface_release_debug target release debug)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs Qt5::Widgets INTERFACE_LINK_LIBRARIES)

  if(EXISTS "${release}" AND EXISTS "${debug}")
    set(debug_gen_expr "$<$<CONFIG:Debug>:${debug}>")
    set(nondebug_gen_expr "$<$<NOT:$<CONFIG:Debug>>:${release}>")
    set(gen_expr "${debug_gen_expr};${nondebug_gen_expr}")

    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${gen_expr};${linked_libs}"
    )
  else()
    if(EXISTS "${release}")
      set_target_properties(
          ${target}
          PROPERTIES
          INTERFACE_LINK_LIBRARIES "${release};${linked_libs}"
      )
    elseif(EXISTS "${debug}")
      set_target_properties(
          ${target}
          PROPERTIES
          INTERFACE_LINK_LIBRARIES "${debug};${linked_libs}"
      )
    else()
      message(FATAL_ERROR "At least one file must exist: ${release} ${debug}")
    endif()
  endif()
endfunction()

if(IOS)
  # Frameworks
  _hunter_plugin_add_interface(Qt5::Widgets "-framework UIKit")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework AssetsLibrary")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework OpenGLES")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework Foundation")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework QuartzCore")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework CoreFoundation")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework CoreText")
  _hunter_plugin_add_interface(Qt5::Widgets "-framework CoreGraphics")

  # 3rdParty
  _hunter_plugin_add_interface(Qt5::Widgets "z") # TODO: link Hunter version

  # Qt non-imported
  _hunter_plugin_add_interface_release_debug(
      Qt5::Widgets
      "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng.a"
      "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng_debug.a"
  )

  _hunter_plugin_add_interface_release_debug(
      Qt5::Widgets
      "${_qt5Widgets_install_prefix}/lib/libqtpcre.a"
      "${_qt5Widgets_install_prefix}/lib/libqtpcre_debug.a"
  )

  _hunter_plugin_add_interface_release_debug(
      Qt5::Widgets
      "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport.a"
      "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport_debug.a"
  )

  set(
      _libqios_release
      "${_qt5Widgets_install_prefix}/plugins/platforms/libqios.a"
  )
  set(
      _libqios_debug
      "${_qt5Widgets_install_prefix}/plugins/platforms/libqios_debug.a"
  )

  # Linker flags
  if(EXISTS "${_libqios_release}" AND EXISTS "${_libqios_debug}")
    _hunter_plugin_add_interface(
        Qt5::Widgets
        "-force_load ${_qt5Widgets_install_prefix}/plugins/platforms/libqios$<$<CONFIG:Debug>:_debug>.a"
    )
  elseif(EXISTS "${_libqios_release}")
    _hunter_plugin_add_interface(Qt5::Widgets "-force_load ${_libqios_release}")
  elseif(EXISTS "${_libqios_debug}")
    _hunter_plugin_add_interface(Qt5::Widgets "-force_load ${_libqios_debug}")
  else()
    message(FATAL_ERROR "At least one file must exist: ${_libqios_release} ${_libqios_debug}")
  endif()
elseif(APPLE)
  get_target_property(_qt5_widgets_type Qt5::Widgets TYPE)
  string(COMPARE EQUAL "${_qt5_widgets_type}" "STATIC_LIBRARY" _qt5_is_static)

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_plugins.cpp"
      )
    else()
      set_target_properties(
          Qt5::Widgets
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Widgets_install_prefix}/src/static_qt_plugins.cpp"
      )
    endif()

    find_package(Qt5PrintSupport REQUIRED)

    # Frameworks
    _hunter_plugin_add_interface(Qt5::Widgets "-framework Carbon")
    _hunter_plugin_add_interface(Qt5::Widgets "-framework Cocoa")
    _hunter_plugin_add_interface(Qt5::Widgets "-framework IOKit")
    _hunter_plugin_add_interface(Qt5::Widgets "-framework OpenGL")

    # Qt
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::PrintSupport)
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::QCocoaIntegrationPlugin)

    # Qt non-imported
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng.a"
        "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng_debug.a"
    )

    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libqtpcre.a"
        "${_qt5Widgets_install_prefix}/lib/libqtpcre_debug.a"
    )

    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport.a"
        "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport_debug.a"
    )

    # 3rdParty
    _hunter_plugin_add_interface(Qt5::Widgets "z") # TODO: link Hunter version
    _hunter_plugin_add_interface(Qt5::Widgets "cups") # TODO: Hunterize and link
  endif()
endif()

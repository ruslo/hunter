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
elseif(ANDROID)
  _hunter_plugin_add_interface(Qt5::Widgets "GLESv2")
elseif(UNIX)
  # Linux

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

    find_package(Qt5DBus REQUIRED)

    # Order is important. Clean-up first.
    set_target_properties(Qt5::Widgets PROPERTIES INTERFACE_LINK_LIBRARIES "")

    # 3rd party
    # defined: `glBindTexture'
    _hunter_plugin_add_interface(Qt5::Widgets "GL")

    # defined: 'IceProcessMessages'
    _hunter_plugin_add_interface(Qt5::Widgets "ICE")

    # defined: `SmcCloseConnection'
    _hunter_plugin_add_interface(Qt5::Widgets "SM")

    _hunter_plugin_add_interface(Qt5::Widgets "X11")
    _hunter_plugin_add_interface(Qt5::Widgets "X11-xcb")
    _hunter_plugin_add_interface(Qt5::Widgets "dl")

    # defined: pthread_once
    _hunter_plugin_add_interface(Qt5::Widgets "pthread")

    _hunter_plugin_add_interface(Qt5::Widgets "xcb")

    # defined: `crc32'
    _hunter_plugin_add_interface(Qt5::Widgets "z")

    # defined `hb_ot_tags_from_script'
    # should be set before Qt5::Gui
    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng.a"
    )

    # should be set before Qt5::Gui
    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libqtpcre.a"
    )

    # libs should be set before libQt5PlatformSupport
    # defined: QPlatformMenuItem::activated()
    # (depends on z, libqtharfbuzzng, GL)
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::Gui)

    # before libQt5PlatformSupport.a
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::DBus)

    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libxcb-static.a"
    )
    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libqtfreetype.a"
    )

    # undefined: QPlatformMenuItem::activated() (depends on Qt5::Gui)
    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport.a"
    )

    # undefined reference to `SmcCloseConnection' (depends on SM, ICE)
    _hunter_plugin_add_interface(
        Qt5::Widgets "${_qt5Widgets_install_prefix}/lib/libQt5XcbQpa.a"
    )

    # should be set after libQt5XcbQpa
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::QXcbIntegrationPlugin)
  endif()
elseif(MSVC)
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

    # defined: '_glBindBuffer'
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::Gui_GLESv2)

    # defined: '_hb_buffer_create'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/qtharfbuzzng.lib"
        "${_qt5Widgets_install_prefix}/lib/qtharfbuzzngd.lib"
    )

    # defined: 'CreateTLSIndex'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/translator.lib"
        "${_qt5Widgets_install_prefix}/lib/translatord.lib"
    )

    # defined: '_pcre16_compile2'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/qtpcre.lib"
        "${_qt5Widgets_install_prefix}/lib/qtpcred.lib"
    )

    # defined: '_WSAAsyncSelect'
    _hunter_plugin_add_interface(Qt5::Widgets ws2_32)

    # for static plugin
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::QWindowsIntegrationPlugin)

    # defined: 'QBasicFontDatabase::populateFontDatabase'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/Qt5PlatformSupport.lib"
        "${_qt5Widgets_install_prefix}/lib/Qt5PlatformSupportd.lib"
    )

    # defined: '_ImmGetDefaultIMEWnd'
    _hunter_plugin_add_interface(Qt5::Widgets imm32)

    # defined: '__imp__PlaySoundW'
    _hunter_plugin_add_interface(Qt5::Widgets winmm)

    # defined: '_eglChooseConfig'
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::Gui_EGL)

    # defined: '_Direct3DCreate9'
    _hunter_plugin_add_interface(Qt5::Widgets d3d9)

    # defined: '_IID_IDirect3D9'
    _hunter_plugin_add_interface(Qt5::Widgets dxguid)

    # defined: '_FT_New_Face'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/qtfreetype.lib"
        "${_qt5Widgets_install_prefix}/lib/qtfreetyped.lib"
    )

    # defined: 'pp::Preprocessor::Preprocessor'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/preprocessor.lib"
        "${_qt5Widgets_install_prefix}/lib/preprocessord.lib"
    )
  endif()
elseif(MINGW)
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

    # Order is important. Clean-up first.
    set_target_properties(Qt5::Widgets PROPERTIES INTERFACE_LINK_LIBRARIES "")

    # defined: 'FT_New_Memory_Face'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libqtfreetype.a"
        "${_qt5Widgets_install_prefix}/lib/libqtfreetyped.a"
    )

    # defined: 'ImmGetVirtualKey'
    _hunter_plugin_add_interface(Qt5::Widgets imm32)

    # defined: '_imp__PlaySoundW'
    _hunter_plugin_add_interface(Qt5::Widgets winmm)

    # defined: vtable for QPlatformNativeInterface
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupport.a"
        "${_qt5Widgets_install_prefix}/lib/libQt5PlatformSupportd.a"
    )

    # defined: '_imp__WSAAsyncSelect'
    _hunter_plugin_add_interface(Qt5::Widgets ws2_32)

    # defined: 'pcre16_exec'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libqtpcre.a"
        "${_qt5Widgets_install_prefix}/lib/libqtpcred.a"
    )

    # defined: 'uncompress'
    _hunter_plugin_add_interface(Qt5::Widgets z) # TODO: link Hunter version

    # defined: '_imp__glDepthRange'
    _hunter_plugin_add_interface(Qt5::Widgets opengl32)

    # defined: 'QObject::objectName'

    # defined: '_hb_buffer_create'
    _hunter_plugin_add_interface_release_debug(
        Qt5::Widgets
        "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzng.a"
        "${_qt5Widgets_install_prefix}/lib/libqtharfbuzzngd.a"
    )

    # defined: 'QPalette::~QPalette'
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::Gui)

    # for static plugin
    _hunter_plugin_add_interface(Qt5::Widgets Qt5::QWindowsIntegrationPlugin)
  endif()
endif()

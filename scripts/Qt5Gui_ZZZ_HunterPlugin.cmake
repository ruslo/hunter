# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(NOT TARGET Qt5::Gui)
  message(FATAL_ERROR "Expected target Qt5::Gui")
endif()

get_target_property(_qt5_type Qt5::Gui TYPE)
string(COMPARE EQUAL "${_qt5_type}" "STATIC_LIBRARY" _qt5_is_static)

string(COMPARE EQUAL "${_qt5Gui_install_prefix}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR "Variable not set: _qt5Gui_install_prefix")
endif()

if(NOT EXISTS "${_qt5Gui_install_prefix}")
  message(
      FATAL_ERROR
      "Directory not exists: ${_qt5Gui_install_prefix}"
      " (variable _qt5Gui_install_prefix)"
  )
endif()

if(NOT IS_DIRECTORY "${_qt5Gui_install_prefix}")
  message(
      FATAL_ERROR
      "Is not directory: ${_qt5Gui_install_prefix}"
      " (variable _qt5Gui_install_prefix)"
  )
endif()

# Add library, framework or link flags
function(_hunter_plugin_add_interface target lib)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)

  if(linked_libs)
    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${lib};${linked_libs}"
    )
  else()
    set_target_properties(
        ${target}
        PROPERTIES
        INTERFACE_LINK_LIBRARIES "${lib}"
    )
  endif()
endfunction()

function(_hunter_plugin_add_interface_release_debug target release debug)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)

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
  #
elseif(APPLE)
  #
elseif(UNIX)
  # Linux

  if(_qt5_is_static)
    # defined: `glBindTexture'
    _hunter_plugin_add_interface(Qt5::Gui "GL")

    _hunter_plugin_add_interface(Qt5::Gui "png")

    _hunter_plugin_add_interface(Qt5::Gui "jpeg")
  endif()
elseif(MSVC)
  #
elseif(MINGW)
  #
endif()

if(TARGET Qt5::QXcbEglIntegrationPlugin)
  # QXcbEglIntegrationPlugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QXcbEglIntegrationPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QXcbEglIntegrationPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QXcbEglIntegrationPlugin.cpp"
      )
    endif()
  endif()
  _hunter_plugin_add_interface(Qt5::QXcbEglIntegrationPlugin "EGL")
endif()

if(TARGET Qt5::QDDSPlugin)
  # QDDSPlugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QDDSPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QDDSPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QDDSPlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::QICNSPlugin)
  # QICNSPlugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QICNSPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QICNSPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QICNSPlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::QICOPlugin)
  # QICOPlugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QICOPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QICOPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QICOPlugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::QJp2Plugin)
  # QJp2Plugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QJp2Plugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QJp2Plugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QJp2Plugin.cpp"
      )
    endif()
  endif()
endif()

if(TARGET Qt5::QMngPlugin)
  # QMngPlugin is not always installed (?),
  # for simplicity check existence of target

  if(_qt5_is_static)
    if(CMAKE_VERSION VERSION_LESS 3.1)
      message(
          WARNING
          "Can't use INTERFACE_SOURCES properties. "
          "Please update CMake to version 3.1+ or add source manually: "
          "\${QT_ROOT}/src/static_qt_QMngPlugin.cpp"
      )
    else()
      set_target_properties(
          Qt5::QMngPlugin
          PROPERTIES
          INTERFACE_SOURCES
          "${_qt5Gui_install_prefix}/src/static_qt_QMngPlugin.cpp"
      )
    endif()
  endif()
endif()

if(NOT EXISTS "${_qt5Qml_install_prefix}")
  message(FATAL_ERROR "_qt5Qml_install_prefix not found")
endif()

if(NOT TARGET Qt5::Qml)
  message(FATAL_ERROR "Qt5::Qml target not found")
endif()

get_target_property(_qt5_type Qt5::Qml TYPE)
string(COMPARE EQUAL "${_qt5_type}" "STATIC_LIBRARY" _qt5_is_static)

function(_hunter_plugin_add_interface_release_debug target release debug)
  if(NOT TARGET "${target}")
    message(FATAL_ERROR "Target not exists: ${target}")
  endif()

  get_target_property(linked_libs ${target} INTERFACE_LINK_LIBRARIES)
  if(NOT linked_libs)
    set(linked_libs "")
  endif()

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

if(NOT TARGET Qt5::QmlQtQuick2Plugin AND _qt5_is_static)
  if(IOS)
    add_library(Qt5::QmlQtQuick2Plugin MODULE IMPORTED)

    set(_release_lib "${_qt5Qml_install_prefix}/qml/QtQuick.2/libqtquick2plugin.a")
    set(_debug_lib "${_qt5Qml_install_prefix}/qml/QtQuick.2/libqtquick2plugin_debug.a")

    if(EXISTS "${_release_lib}")
      set_property(
          TARGET
          Qt5::QmlQtQuick2Plugin
          APPEND
          PROPERTY
          IMPORTED_CONFIGURATIONS RELEASE
      )
      set_target_properties(
          Qt5::QmlQtQuick2Plugin
          PROPERTIES
          IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
          IMPORTED_LOCATION_RELEASE "${_release_lib}"
      )
    endif()

    if(EXISTS "${_debug_lib}")
      set_property(
          TARGET
          Qt5::QmlQtQuick2Plugin
          APPEND
          PROPERTY
          IMPORTED_CONFIGURATIONS DEBUG
      )
      set_target_properties(
          Qt5::QmlQtQuick2Plugin
          PROPERTIES
          IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
          IMPORTED_LOCATION_DEBUG "${_debug_lib}"
      )
    endif()
  endif()

  if(CMAKE_VERSION VERSION_LESS 3.1)
    message(
        WARNING
        "Can't use INTERFACE_SOURCES properties. "
        "Please update CMake to version 3.1+ or add source manually: "
        "\${QT_ROOT}/src/static_qt_QtQuick2Plugin.cpp"
    )
  else()
    set_target_properties(
        Qt5::QmlQtQuick2Plugin
        PROPERTIES
        INTERFACE_SOURCES
        "${_qt5Qml_install_prefix}/src/static_qt_QtQuick2Plugin.cpp"
    )
  endif()
endif()

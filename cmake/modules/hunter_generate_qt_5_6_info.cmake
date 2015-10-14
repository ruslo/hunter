# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_qt_add_module)
include(hunter_test_string_not_empty)

# See cmake/projects/Qt/generate.sh

# This function will be used in build scheme too so it's better to set
# regular CMake variables like WIN32 or ANDROID explicitly by is_{android,win32}

function(
    hunter_generate_qt_5_6_info
    component_name
    skip_components_varname
    component_depends_on_varname
    is_android
    is_win32
)
  hunter_test_string_not_empty("${component_name}")
  hunter_test_string_not_empty("${skip_components_varname}")
  hunter_test_string_not_empty("${component_depends_on_varname}")

  string(COMPARE NOTEQUAL "${ARGN}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed argument: ${ARGN}")
  endif()

  set(
      all_components
      qt3d
      qtactiveqt
      qtandroidextras
      qtbase
      qtcanvas3d
      qtconnectivity
      qtdeclarative
      qtdoc
      qtenginio
      qtgraphicaleffects
      qtimageformats
      qtlocation
      qtmacextras
      qtmultimedia
      qtquickcontrols
      qtquickcontrols2
      qtscript
      qtsensors
      qtserialport
      qtsvg
      qttools
      qttranslations
      qtwayland
      qtwebchannel
      qtwebengine
      qtwebsockets
      qtwebview
      qtwinextras
      qtx11extras
      qtxmlpatterns
  )

  # This is modified copy/paste code from <qt-sources>/qt.pro

  if(is_android)
    set(ANDROID_EXTRAS qtandroidextras)
  else()
    set(ANDROID_EXTRAS "")
  endif()

  if(is_win32)
    set(ACTIVE_QT qtactiveqt)
  else()
    # Project MESSAGE: ActiveQt is a Windows Desktop-only module. Will just generate a docs target.
    set(ACTIVE_QT "")
  endif()

  # Order is important. Component of each section should not depends on entry
  # from section below.

  # Components are in list but not exists in fact:
  # * qtdocgallery
  # * qtfeedback
  # * qtpim
  # * qtsystems

  # Depends on nothing
  hunter_qt_add_module(NAME qtbase)
  # --

  # Depends only on qtbase
  hunter_qt_add_module(NAME qtandroidextras COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtmacextras COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtx11extras COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtsvg COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtxmlpatterns COMPONENTS qtbase)
  hunter_qt_add_module(NAME ${ACTIVE_QT} COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtimageformats COMPONENTS qtbase)
  hunter_qt_add_module(NAME qtserialport COMPONENTS qtbase)
  # --

  # --
  hunter_qt_add_module(NAME qtdeclarative COMPONENTS qtbase qtsvg qtxmlpatterns)
  # --

  # Depends only on qtbase/qtdeclarative
  hunter_qt_add_module(NAME qtcanvas3d COMPONENTS qtdeclarative)
  hunter_qt_add_module(NAME qtdoc COMPONENTS qtdeclarative)
  hunter_qt_add_module(NAME qtenginio COMPONENTS qtdeclarative)
  hunter_qt_add_module(NAME qtgraphicaleffects COMPONENTS qtdeclarative)
  hunter_qt_add_module(NAME qtmultimedia COMPONENTS qtbase qtdeclarative)
  hunter_qt_add_module(NAME qtsensors COMPONENTS qtbase qtdeclarative)
  hunter_qt_add_module(NAME qtwayland COMPONENTS qtbase qtdeclarative)
  hunter_qt_add_module(NAME qtwebsockets COMPONENTS qtbase qtdeclarative)
  # --

  # --
  hunter_qt_add_module(NAME qtquickcontrols COMPONENTS qtdeclarative qtgraphicaleffects)
  hunter_qt_add_module(NAME qtwinextras COMPONENTS qtbase qtdeclarative qtmultimedia)
  hunter_qt_add_module(NAME qtconnectivity COMPONENTS qtbase ${ANDROID_EXTRAS} qtdeclarative)
  hunter_qt_add_module(NAME qtwebchannel COMPONENTS qtbase qtdeclarative qtwebsockets)
  hunter_qt_add_module(NAME qt3d COMPONENTS qtdeclarative qtimageformats)
  # --

  # --
  hunter_qt_add_module(NAME qtlocation COMPONENTS qtbase qtdeclarative qtquickcontrols)
  hunter_qt_add_module(NAME qtquickcontrols2 COMPONENTS qtquickcontrols)
  # --

  # --
  hunter_qt_add_module(NAME qttools COMPONENTS qtbase qtdeclarative ${ACTIVE_QT})
  hunter_qt_add_module(NAME qtwebengine COMPONENTS qtquickcontrols qtwebchannel qtlocation)
  # --

  # --
  hunter_qt_add_module(NAME qtwebview COMPONENTS qtdeclarative qtwebengine)
  hunter_qt_add_module(NAME qtscript COMPONENTS qtbase qttools)
  hunter_qt_add_module(NAME qttranslations COMPONENTS qttools)
  # --

  string(COMPARE EQUAL "${component_name}" "qtbase" is_qtbase)
  string(COMPARE EQUAL "${component_${component_name}_depends_on}" "" depends_on_nothing)
  if(is_qtbase)
    if(NOT depends_on_nothing)
      hunter_internal_error("qtbase should not depends on anything")
    endif()
  else()
    if(depends_on_nothing)
      hunter_internal_error(
          "component `${component_name}` should have at least one dependency:"
          " qtbase"
      )
    endif()
  endif()

  set(
      "${component_depends_on_varname}"
      "${component_${component_name}_depends_on}"
      PARENT_SCOPE
  )

  set(skip_list ${all_components})
  list(
      REMOVE_ITEM
      skip_list
      "${component_name}"
      ${component_${component_name}_depends_on}
  )
  set("${skip_components_varname}" "${skip_list}" PARENT_SCOPE)
endfunction()

#!/bin/bash -e

# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

set -x

# This list is a list of directories "qt*" from top Qt sources.
# (see <qt-sources>/qtbase/configure, find 'skip' case in switch)
# In case something need to be modified here probably this module
# should be modified too: hunter_generate_qt_info
QT_LIBS="
    qt3d
    qtactiveqt
    qtandroidextras
    qtbase
    qtcanvas3d
    qtcharts
    qtconnectivity
    qtdatavis3d
    qtdeclarative
    qtdoc
    qtdocgallery
    qtenginio
    qtfeedback
    qtgamepad
    qtgraphicaleffects
    qtimageformats
    qtlocation
    qtmacextras
    qtmultimedia
    qtnetworkauth
    qtpim
    qtpurchasing
    qtqa
    qtquick1
    qtquickcontrols
    qtquickcontrols2
    qtremoteobjects
    qtrepotools
    qtscript
    qtscxml
    qtsensors
    qtserialbus
    qtserialport
    qtspeech
    qtsvg
    qtsystems
    qttools
    qttranslations
    qtvirtualkeyboard
    qtwayland
    qtwebchannel
    qtwebengine
    qtwebkit
    qtwebkit-examples
    qtwebsockets
    qtwebview
    qtwinextras
    qtx11extras
    qtxmlpatterns
"

for library in ${QT_LIBS};
do
  LIBRARY_UPPER=`echo ${library} | tr '[:lower:]' '[:upper:]'`
  echo "${library} -- ${LIBRARY_UPPER}"

  mkdir -p ${library}
  cp hunter.cmake.in ${library}/hunter.cmake
  gsed -i "s,@qt_component@,${library}," ${library}/hunter.cmake
  gsed -i "s,@QT_COMPONENT@,${LIBRARY_UPPER},g" ${library}/hunter.cmake
done

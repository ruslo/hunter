# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterGenerateQtInfo)

include(hunter_generate_qt_info)

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
    qtquick1
    qtquickcontrols
    qtscript
    qtsensors
    qtserialport
    qtsvg
    qttools
    qttranslations
    qtwayland
    qtwebchannel
    qtwebengine
    qtwebkit
    qtwebkit-examples
    qtwebsockets
    qtwinextras
    qtx11extras
    qtxmlpatterns
)

### Test qtbase
hunter_generate_qt_info("qtbase" toskip depends_on nobuild "5.5.0" "NO" "NO")

list(APPEND toskip qtbase)
list(SORT toskip)
string(COMPARE EQUAL "${toskip}" "${all_components}" is_good)
if(NOT is_good)
  message(FATAL_ERROR "qtbase should skip all components: ${toskip}")
endif()

string(COMPARE EQUAL "${depends_on}" "" is_good)
if(NOT is_good)
  message(FATAL_ERROR "qtbase should not depends on anything: ${depends_on}")
endif()

### Test android component
hunter_generate_qt_info("qtconnectivity" toskip depends_on nobuild "5.5.0" "YES" "NO")
list(FIND depends_on "qtandroidextras" found)
if(found EQUAL -1)
  message(FATAL_ERROR "qtandroidextras component not found")
endif()

### Test no android component
hunter_generate_qt_info("qtconnectivity" toskip depends_on nobuild "5.5.0" "0" "NO")
list(FIND depends_on "qtandroidextras" found)
if(NOT found EQUAL -1)
  message(FATAL_ERROR "qtandroidextras component found")
endif()

###
hunter_generate_qt_info("qtsvg" toskip depends_on nobuild "5.5.0" "NO" "NO")
string(COMPARE EQUAL "qtbase" "${depends_on}" is_good)
if(NOT is_good)
  message(FATAL_ERROR "qtsvg depends only on qtbase: ${depends_on}")
endif()

### Test qtdeclarative
hunter_generate_qt_info("qtdeclarative" toskip depends_on nobuild "5.5.0" "NO" "NO")
string(COMPARE EQUAL "${depends_on}" "qtbase;qtsvg;qtxmlpatterns" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Not good")
endif()

### Test
hunter_generate_qt_info("qtenginio" toskip depends_on nobuild "5.5.0" "NO" "") # empty string should work fine too
string(COMPARE EQUAL "${depends_on}" "qtbase;qtdeclarative;qtsvg;qtxmlpatterns" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Not good")
endif()

### Test
hunter_generate_qt_info("qtwebchannel" toskip depends_on nobuild "5.5.0" "NO" "NO")
string(COMPARE EQUAL "${depends_on}" "qtbase;qtdeclarative;qtsvg;qtwebsockets;qtxmlpatterns" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Not good")
endif()

### Test
hunter_generate_qt_info("qtwebkit" toskip depends_on nobuild "5.5.0" "NO" "NO")
string(
    COMPARE
    EQUAL
    "${depends_on}"
    "qtbase;qtdeclarative;qtlocation;qtmultimedia;qtsensors;qtsvg;qtwebchannel;qtwebsockets;qtxmlpatterns"
    is_good
)
if(NOT is_good)
  message(FATAL_ERROR "Not good: ${depends_on}")
endif()

### Test
hunter_generate_qt_info("qtwebengine" toskip depends_on nobuild "5.5.0" "NO" "NO")
string(
    COMPARE
    EQUAL
    "${depends_on}"
    "qtbase;qtdeclarative;qtgraphicaleffects;qtlocation;qtmultimedia;qtquickcontrols;qtsensors;qtsvg;qtwebchannel;qtwebkit;qtwebsockets;qtxmlpatterns"
    is_good
)
if(NOT is_good)
  message(FATAL_ERROR "Not good: ${depends_on}")
endif()

message("PASSED")

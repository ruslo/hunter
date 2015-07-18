# Simple Qt Widgets project created by QtCreator
# CmakeLists.txt from http://doc.qt.io/qt-5/cmake-manual.html

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-widgets)

hunter_add_package(Qt)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

# Find the QtWidgets library
find_package(Qt5Widgets)

get_target_property(qt5_widgets_type Qt5::Widgets TYPE)
string(COMPARE EQUAL "${qt5_widgets_type}" "STATIC_LIBRARY" qt5_is_static)
if(qt5_is_static)
  set(plugins_src static_qt_plugins.cpp)
else()
  set(plugins_src)
endif()

# Tell CMake to create the helloworld executable
add_executable(
    helloworld
    WIN32
    main.cpp
    MainWindow.cpp
    MainWindow.ui
    ${plugins_src}
)

# Use the Widgets module from Qt 5.
target_link_libraries(helloworld Qt5::Widgets)

if(qt5_is_static)
  if(APPLE)
    find_package(Qt5PrintSupport)
    set(qt_lib_dir "${Qt5Core_DIR}/../..")

    target_link_libraries(
        helloworld
        # Frameworks
        "-framework Carbon"
        "-framework Cocoa"
        "-framework IOKit"
        "-framework OpenGL"
        # Qt
        Qt5::PrintSupport
        Qt5::QCocoaIntegrationPlugin
        # Qt non-imported
        "${qt_lib_dir}/libqtharfbuzzng$<$<CONFIG:Debug>:_debug>.a"
        "${qt_lib_dir}/libqtpcre$<$<CONFIG:Debug>:_debug>.a"
        "${qt_lib_dir}/libQt5PlatformSupport$<$<CONFIG:Debug>:_debug>.a"
        # 3rdParty
        z # TODO: link Hunter version
        cups # TODO: Hunterize and link
    )
  endif()
endif()

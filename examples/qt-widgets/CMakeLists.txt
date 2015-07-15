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

# Find the QtWidgets library
find_package(Qt5Widgets)

qt5_wrap_ui(_mainwindow_ui MainWindow.ui)

# Tell CMake to create the helloworld executable
add_executable(helloworld WIN32 main.cpp MainWindow.cpp ${_mainwindow_ui})

# Use the Widgets module from Qt 5.
target_link_libraries(helloworld Qt5::Widgets)

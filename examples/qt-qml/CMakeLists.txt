cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-qml)

hunter_add_package(Qt COMPONENTS qtdeclarative)

find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

add_executable(qmlexample main.cpp)
target_link_libraries(
    qmlexample Qt5::Widgets Qt5::Quick Qt5::QTcpServerConnection
)

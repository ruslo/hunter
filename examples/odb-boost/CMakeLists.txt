# Copyright (c) 2016, Alexandre Pretyman
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(odb-boost-example)

hunter_add_package(odb-compiler)
hunter_add_package(odb-sqlite)
hunter_add_package(odb-boost)
find_package(odb COMPONENTS compiler sqlite boost)

set(${PROJECT_NAME}_SOURCES
    driver.cxx
    database.hxx
)

set(${PROJECT_NAME}_ODB_HEADERS
    person.hxx
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
    ${${PROJECT_NAME}_ODB_HEADERS}
)

odb_compile(
    ${PROJECT_NAME}
    FILES
      ${${PROJECT_NAME}_ODB_HEADERS}
    DB
      sqlite
    PROFILE
      boost
    GENERATE_QUERY
    GENERATE_SESSION
    GENERATE_SCHEMA
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
      CXX_STANDARD 11
      CXX_STANDARD_REQUIRED ON
)

target_link_libraries(${PROJECT_NAME} odb::sqlite odb::boost)

target_include_directories(${PROJECT_NAME}
    PRIVATE
      ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
      DATABASE_SQLITE
)


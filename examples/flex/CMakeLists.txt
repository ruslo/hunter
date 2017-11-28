cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-flex)

hunter_add_package(flex)
find_package(FLEX REQUIRED)

FLEX_TARGET(MyScanner numbers.lex ${CMAKE_CURRENT_BINARY_DIR}/numbers.cpp)
add_executable(main ${FLEX_MyScanner_OUTPUTS})
target_include_directories(main PUBLIC ${FLEX_INCLUDE_DIRS})
target_link_libraries(main ${FLEX_LIBRARIES})

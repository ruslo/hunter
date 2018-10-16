#!/usr/bin/cmake -P

if("${PKG}" STREQUAL "")
  message(FATAL_ERROR "No PKG parameter")
endif()

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/hunter.cmake.in 
  ${CMAKE_CURRENT_LIST_DIR}/../cmake/projects/${PKG}/hunter.cmake 
  @ONLY)
  
configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/foo.rst.in
  ${CMAKE_CURRENT_LIST_DIR}/../docs/packages/pkg/${PKG}.rst
  @ONLY
)

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/example-CMakeLists.txt.in
  ${CMAKE_CURRENT_LIST_DIR}/../examples/${PKG}/CMakeLists.txt
  @ONLY
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/../examples/foo/boo.cpp
  DESTINATION ${CMAKE_CURRENT_LIST_DIR}/../examples/${PKG}
)
  
message("cmake/projects/${PKG}/hunter.cmake")
message("docs/packages/pkg/${PKG}.rst")
message("examples/${PKG}/CMakeLists.txt")
message("examples/${PKG}/boo.cpp")

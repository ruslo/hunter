# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-assimp)

# download assimp
hunter_add_package(Assimp)

FIND_PACKAGE(OpenGL )
FIND_PACKAGE(GLUT)
IF ( MSVC )
  SET(M_LIB)
ELSE ( MSVC )
  find_library(M_LIB m)
ENDIF ( MSVC )

IF ( NOT GLUT_FOUND )
  IF ( MSVC )
    SET ( GLUT_FOUND 1 )
    SET ( GLUT_INCLUDE_DIR ${Assimp_SOURCE_DIR}/samples/glut/ )
    SET ( GLUT_LIBRARIES ${Assimp_SOURCE_DIR}/samples/glut/glut32.lib )
  ELSE ( MSVC )
    MESSAGE( WARNING "Please install glut." )
  ENDIF ( MSVC )
ENDIF ( NOT GLUT_FOUND )

INCLUDE_DIRECTORIES(
  ${OPENGL_INCLUDE_DIR}
  ${GLUT_INCLUDE_DIR}
)

find_package(Assimp CONFIG REQUIRED)

ADD_EXECUTABLE( assimp_simpleogl Sample_SimpleOpenGL.c)

TARGET_LINK_LIBRARIES( assimp_simpleogl Assimp::assimp ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES} ${M_LIB} )

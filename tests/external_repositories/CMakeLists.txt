cmake_minimum_required(VERSION 3.0)
project(external-repos)

foreach(project Foo Bar)
  set(build_dir "${CMAKE_BINARY_DIR}/${project}")
  execute_process(
    COMMAND "${CMAKE_COMMAND}"
    "-H${CMAKE_SOURCE_DIR}/${project}"
      "-B${build_dir}"
      "-G${CMAKE_GENERATOR}"
    RESULT_VARIABLE ${project}_result
  )
  if(NOT ${project}_result EQUAL 0)
    message(FATAL_ERROR "Could not configure Project ${project} - ${${project}_result}")
  endif()
  if(NOT EXISTS "${build_dir}/root")
    message(FATAL_ERROR "Output file not written")
  endif()
  file(READ "${build_dir}/root" ${project}_sha)
endforeach()

if("${Foo_sha}" STREQUAL "${Bar_sha}")
  message(FATAL_ERROR "Should point to different prefix roots")
endif()
if(NOT EXISTS "${Foo_sha}/unsupported/Eigen/ArpackSupport")
  message(FATAL_ERROR "Expected ArpackSupport in eigen 3.2.8")
endif()
if(EXISTS "${Bar_sha}/unsupported/Eigen/ArpackSupport")
  message(FATAL_ERROR "Did not ArpackSupport in eigen 3.2.4")
endif()

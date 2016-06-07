# Copyright (c) 2016 Dennis Sitelew
# All rights reserved.

if(NOT HUNTER_ENABLED)
  macro(hunter_status_debug)
    message(${ARGV})
  endmacro()
endif()

hunter_status_debug("BENCHMARK_ROOT: ${BENCHMARK_ROOT}")

find_path(
    BENCHMARK_INCLUDE_DIR benchmark/benchmark.h
    PATHS "${BENCHMARK_ROOT}/include"
    NO_DEFAULT_PATH
)

find_library(
    BENCHMARK_LIBRARY benchmark
    NAMES ${BENCHMARK_NAMES}
    PATHS "${BENCHMARK_ROOT}/lib"
)

find_package(Threads REQUIRED)

if(BENCHMARK_INCLUDE_DIR AND BENCHMARK_LIBRARY)
  set(benchmark_FOUND TRUE)

  add_library("benchmark::library" UNKNOWN IMPORTED)
  set_target_properties("benchmark::library" PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${BENCHMARK_INCLUDE_DIR}"
			INTERFACE_COMPILE_OPTIONS -fno-omit-frame-pointer
      IMPORTED_LOCATION "${BENCHMARK_LIBRARY}"
      INTERFACE_LINK_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}
  )
elseif(benchmark_FIND_REQUIRED)
  message(FATAL_ERROR "benchmark library not found")
else()
  set(benchmark_FOUND FALSE)
endif()


# ex: set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


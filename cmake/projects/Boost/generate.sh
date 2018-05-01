#!/bin/bash -e

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

BOOST_LIBS="
    atomic
    chrono
    context
    coroutine
    contract
    date_time
    exception
    fiber
    filesystem
    graph
    graph_parallel
    iostreams
    locale
    log
    math
    mpi
    program_options
    python
    random
    regex
    serialization
    signals
    system
    test
    thread
    timer
    wave
"

for library in ${BOOST_LIBS};
do
  LIBRARY_UPPER=`echo ${library} | tr '[:lower:]' '[:upper:]'`
  echo "${library} -- ${LIBRARY_UPPER}"

  mkdir -p ${library}
  cp hunter.cmake.in ${library}/hunter.cmake
  sed -i.back "s,boost_component,${library}," ${library}/hunter.cmake
  sed -i.back "s,BOOST_COMPONENT,${LIBRARY_UPPER}," ${library}/hunter.cmake
done

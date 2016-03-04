cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ZeroMQ)

hunter_add_package(ZeroMQ)

find_package(ZeroMQ CONFIG REQUIRED)

add_executable(version main.cpp)
target_link_libraries(version ZeroMQ::libzmq)

if(WIN32)
  find_library(SODIUM_FOUND sodium)
endif()

include(CheckLibraryExists)
check_library_exists(ws2_32 WSAGetLastError "" HAVE_WS2_32)
check_library_exists(ws2 WSAGetLastError "" HAVE_WS2)
check_library_exists(rpcrt4 RpcErrorClearInformation "" HAVE_RPCRT4)
check_library_exists(iphlpapi GetAdapterOrderMap "" HAVE_IPHLAPI)

find_library(RT_LIBRARY rt)
find_package(Threads)

add_executable(version-static main.cpp)
target_link_libraries(version-static ZeroMQ::libzmq-static)
target_link_libraries(version-static ${SODIUM_LIBRARY})
target_link_libraries(version-static ${CMAKE_THREAD_LIBS_INIT})

if(HAVE_WS2_32)
  target_link_libraries(version-static ws2_32)
elseif(HAVE_WS2)
  target_link_libraries(version-static ws2)
endif()

if(HAVE_RPCRT4)
  target_link_libraries(version-static rpcrt4)
endif()

if(HAVE_IPHLAPI)
  target_link_libraries(version-static iphlpapi)
endif()

if(RT_LIBRARY)
  target_link_libraries(version-static ${RT_LIBRARY})
endif()

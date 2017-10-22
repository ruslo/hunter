cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(rocksdb-test)

hunter_add_package(RocksDB)
find_package(RocksDB CONFIG REQUIRED)

add_executable(rocksdb-test test.cpp)
set_target_properties(rocksdb-test PROPERTIES CXX_STANDARD 11)
target_link_libraries(rocksdb-test PRIVATE RocksDB::rocksdb)

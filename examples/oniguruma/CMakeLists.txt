cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-oniguruma)

# DOCUMENTATION_START {
hunter_add_package(oniguruma)
find_package(oniguruma CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main oniguruma::onig)
# DOCUMENTATION_END }

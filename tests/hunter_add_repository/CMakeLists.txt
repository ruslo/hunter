cmake_minimum_required(VERSION 3.0)
set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_SOURCE_DIR}/cmake/Hunter/config.cmake")
include("${CMAKE_SOURCE_DIR}/../../examples/common.cmake")
# Creates a fake release from a local repository
# This is really just to make testing easier at this point
# Nominally, it could be used to check the SHA of a local repo and ensure stuff
# is rebuilt as necessary
include(hunter_pack_directory)
hunter_pack_directory(
  "${CMAKE_CURRENT_SOURCE_DIR}/repository" "${CMAKE_CURRENT_BINARY_DIR}/repository" reposha)

# Now add repository
include(hunter_add_repository)
hunter_add_repository(
  URL "${CMAKE_CURRENT_BINARY_DIR}/repository/${reposha}.tar.bz2" SHA1 ${reposha})

# Checks repo was added
set(reponame fakey-0_0_1)
if(NOT HUNTER_REPOSITORY_${reponame}_NAME STREQUAL "fakey")
  message(FATAL_ERROR "Incorrect repo variable ${HUNTER_REPOSITORY_fakey-0.0.1-NAME}")
endif()
set(recipe_dir "${HUNTER_REPOSITORY_${reponame}_DIRECTORY}")
# Checks it is in the lsit recipe directories
list(FIND HUNTER_RECIPE_DIRS "${recipe_dir}" index)
if(index STREQUAL -1)
  message(FATAL_ERROR "Did not find repo ${recipe_dir} in list of recipes ${HUNTER_RECIPE_DIRS}")
endif()

project(hunter_repos)

hunter_add_package(FlakeyBlamey)
find_package(FlakeyBlamey REQUIRED)

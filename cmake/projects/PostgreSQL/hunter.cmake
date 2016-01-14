# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_POSTGRESQL_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_POSTGRESQL_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    PostgreSQL
    VERSION
    "9.5.0"
    URL
    "https://github.com/hunter-packages/PostgreSQL/archive/PostgreSQL-9.5.0.tar.gz"
    SHA1
    b82ddcee4644ef42f3a69ee93916afa448d178c4
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME PostgreSQL)


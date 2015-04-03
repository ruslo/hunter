# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_CSV_PARSER_CPLUSPLUS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CSV_PARSER_CPLUSPLUS_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

# Print version that we are trying to download (i.e. from 'config.cmake')
hunter_add_version_start(csv-parser-cplusplus)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    csv-parser-cplusplus
    VERSION
    "1.0.0"
    URL
    "https://github.com/headupinclouds/csv-parser-cplusplus/archive/v1.0.0.tar.gz"
    SHA1
    62eac8c3c82826731cb92556f07eaa56be231ad7
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_no_install) # (for cmake modules and header-only libraries)

hunter_download(PACKAGE_NAME csv-parser-cplusplus)
# Added by Denis Kerzhemanov, 2015

if(DEFINED HUNTER_CMAKE_PROJECTS_LUA_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LUA_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    Lua
    VERSION
    "5.3.2"
    URL
    "https://github.com/hunter-packages/lua/archive/v5.3.2-p1.tar.gz"
    SHA1
    0697a2fa7fc657aac91e0a31f9f7709aebf1e3db
)

hunter_configuration_types(Lua CONFIGURATION_TYPES Release)
hunter_cacheable(Lua)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Lua)

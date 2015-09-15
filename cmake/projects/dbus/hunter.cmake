if(DEFINED HUNTER_CMAKE_PROJECTS_DBUS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_DBUS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME dbus
    VERSION "1.10.0-hunter-2"
    URL "https://github.com/hunter-packages/dbus/archive/dbus-1.10.0-hunter-2.tar.gz"
    SHA1 0bb28e1f4b22216122f36b9ef0e91201c90a3288 
)

hunter_cmake_args(
    dbus 
    CMAKE_ARGS
      DBUS_ENABLE_XML_DOCS=OFF 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME dbus)

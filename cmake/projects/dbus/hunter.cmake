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
    VERSION "1.10.0-hunter-3"
    URL "https://github.com/hunter-packages/dbus/archive/dbus-1.10.0-hunter-3.tar.gz"
    SHA1 cd9dd58ed375d8c7eae1c1a3b33ae0deae41c47f 
)

hunter_add_version(
    PACKAGE_NAME dbus
    VERSION "1.10.0-hunter-4"
    URL "https://github.com/hunter-packages/dbus/archive/dbus-1.10.0-hunter-4.tar.gz"
    SHA1 5acf0e8c8caa4c01536a66b19cb5f8c0c94817da 
)

hunter_cmake_args(
    dbus 
    CMAKE_ARGS
      DBUS_ENABLE_XML_DOCS=OFF 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME dbus)

include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)
include(hunter_cacheable)
include(hunter_cmake_args)

hunter_add_version(
  PACKAGE_NAME libxdg-basedir
  VERSION "1.2.0"
  URL "https://github.com/devnev/libxdg-basedir/archive/libxdg-basedir-1.2.0.tar.gz"
  SHA1 e671b01b17c8cf785d95dd3aefa93e7cf31e56a5
  )

hunter_configuration_types(libxdg-basedir CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autogen_autotools)
hunter_cacheable(libxdg-basedir)

hunter_cmake_args(
  libxdg-basedir
  CMAKE_ARGS
      PKGCONFIG_EXPORT_TARGETS=libxdg-basedir
  )

hunter_download(PACKAGE_NAME libxdg-basedir
  PACKAGE_INTERNAL_DEPS_ID "1"  # Increment for each new pull request
  PACKAGE_UNRELOCATABLE_TEXT_FILES lib/pkgconfig/libxdg-basedir.pc)

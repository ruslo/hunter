# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  bison
  VERSION
  "3.0.4"
  URL "https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.gz"
  SHA1 "ec1f2706a7cfedda06d29dc394b03e092a1e1b74"
)

hunter_add_version(
  PACKAGE_NAME
  bison
  VERSION
  "3.0.4-p0"
  URL "https://github.com/hunter-packages/bison/releases/download/v3.0.4/bison-3.0.4.tar.gz"
  SHA1 "984caba9061e21d048b71a49bf553d2e32ac8252"
)

hunter_configuration_types(bison CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
# bison is not cacheable at this time because it hard codes paths to m4sugar
# directories in C source code.
hunter_download(PACKAGE_NAME bison)

# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.19.1"
  URL
  "https://www.sqlite.org/2017/sqlite-autoconf-3190100.tar.gz"
  SHA1
  7906083f3d744c7c1ccf8c0f79caaacfd58b363d
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.18.0"
  URL
  "https://www.sqlite.org/2017/sqlite-autoconf-3180000.tar.gz"
  SHA1
  74559194e1dd9b9d577cac001c0e9d370856671b
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.17.0"
  URL
  "https://www.sqlite.org/2017/sqlite-autoconf-3170000.tar.gz"
  SHA1
  7bcff1c158ed9e2c0e159c1b4b6c36d4d65dff8c
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.16.2"
  URL
  "https://www.sqlite.org/2017/sqlite-autoconf-3160200.tar.gz"
  SHA1
  64ca578ad44a94115b1db0406740e14288f74bb8
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.15.2"
  URL
  "https://www.sqlite.org/2016/sqlite-autoconf-3150200.tar.gz"
  SHA1
  31f52169bcfeef9efb61480d0950e928ad059552
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.14.2"
  URL
  "https://www.sqlite.org/2016/sqlite-autoconf-3140200.tar.gz"
  SHA1
  5d3a6bccd9154963641960db61df901a4e0b3ca0
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.12.2"
  URL
  "https://www.sqlite.org/2016/sqlite-autoconf-3120200.tar.gz"
  SHA1
  b43c2e7238e54c50b95fbbd85c48792f4f39af8c
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.11.1"
  URL
  "https://www.sqlite.org/2016/sqlite-autoconf-3110100.tar.gz"
  SHA1
  c4b4dcd735a4daf5a2e2bb90f374484c8d4dad29
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.10.2"
  URL
  "https://www.sqlite.org/2016/sqlite-autoconf-3100200.tar.gz"
  SHA1
  ea4156fc3f6a4a4a2752a5a3ac5c5b3fe7e1a24b
  )

hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "3.8.8.3"
  URL
  "https://www.sqlite.org/2015/sqlite-autoconf-3080803.tar.gz"
  SHA1
  2fe3f6226a2a08a2e814b97cd53e36bb3c597112
  )

# Left for compatibility; prefer an actual version number
hunter_add_version(
  PACKAGE_NAME
  SQLite3
  VERSION
  "autoconf-3080803"
  URL
  "https://www.sqlite.org/2015/sqlite-autoconf-3080803.tar.gz"
  SHA1
  2fe3f6226a2a08a2e814b97cd53e36bb3c597112
  )



hunter_configuration_types(SQLite3 CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_sqlite3_autotools)
hunter_cacheable(SQLite3)
hunter_download(
  PACKAGE_NAME SQLite3
  PACKAGE_INTERNAL_DEPS_ID "2"
  PACKAGE_UNRELOCATABLE_TEXT_FILES
  "lib/libsqlite3.la"
  "lib/pkgconfig/sqlite3.pc"
  )

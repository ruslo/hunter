# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SUGAR_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SUGAR_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version_start(Sugar)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.0"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.0.tar.gz"
    SHA1
    3f1360e447dd23d3db9ce010e217053deb6aebde
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.1"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.1.tar.gz"
    SHA1
    1a8e29badc0e97913996e5228dc9b1788284e416
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.2"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.2.tar.gz"
    SHA1
    393a2c190f76f52b253089d0a03c08de562a8622
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.3"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.3.tar.gz"
    SHA1
    d0929748df6c4cc7126863d5799018e513c73f27
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.4"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.4.tar.gz"
    SHA1
    f5547294647ed386e7bed7fc489f1ba53ab30b57
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.5"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.5.tar.gz"
    SHA1
    0b410ec9576be60ac86bf81cf74def4b79efd342
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.6"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.6.tar.gz"
    SHA1
    6979695f6802b2c980e453dc2eb3ca1ab6bb9fe0
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.7"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.7.tar.gz"
    SHA1
    a364edec71e6d52b809efba833e3041402d2a267
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.8"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.8.tar.gz"
    SHA1
    eca1cd13c0399c50c257dcb679c04ca8177307b8
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.9"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.9.tar.gz"
    SHA1
    fca4165caa3faa2ec88e207ea009927020e443cb
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.10"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.10.tar.gz"
    SHA1
    ca73f6599986089968b112394e9bc7cbb253c574
)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.11"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.11.tar.gz"
    SHA1
    ce98a7090a7fbc0197310c7299746568fddf6a43
)

hunter_pick_scheme(DEFAULT url_sha1_no_install)
hunter_download(PACKAGE_NAME Sugar)

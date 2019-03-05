# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.7.6"
    URL
    "https://github.com/hunter-packages/glm/archive/0.9.7.6-p0.tar.gz"
    SHA1
    6169cec7b94172141431ef4661e70a5e515c1fa6
)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.8.5"
    URL
    "https://github.com/hunter-packages/glm/archive/0.9.8.5.tar.gz"
    SHA1
    04ff6d037916f85219e53731e08eb8660d14a38d
)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.9.0"
    URL
    "https://github.com/g-truc/glm/releases/download/0.9.9.0/glm-0.9.9.0.7z"
    SHA1
    0c0bafb9af65d565a7b026efccddfb965505b019
)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.9.1"
    URL
    "https://github.com/g-truc/glm/releases/download/0.9.9.1/glm-0.9.9.1.7z"
    SHA1
    574ee609d1848cd5425d85b09f5c4c4a1b579099
)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.9.2"
    URL
    "https://github.com/g-truc/glm/releases/download/0.9.9.2/glm-0.9.9.2.7z"
    SHA1
    e25b219ead246b255b369e35c37c2e31430021f2
)
include(GNUInstallDirs)

# glm use custom bundled GNUInstallDirs module so we have to
# set correct value explicitly
hunter_cmake_args(glm CMAKE_ARGS CMAKE_INSTALL_LIBDIR=${CMAKE_INSTALL_LIBDIR})

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glm)
hunter_download(
    PACKAGE_NAME glm
    PACKAGE_UNRELOCATABLE_TEXT_FILES "${CMAKE_INSTALL_LIBDIR}/pkgconfig/glm.pc"
)

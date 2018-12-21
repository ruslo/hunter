# Copyright (c) 2016-2017, Alexandre Pretyman
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

if(EMSCRIPTEN)
  return()
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.2-p0"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.2-p0.tar.gz"
    SHA1
    90f91bab3020db15a0fc07c27c53095fa2dbf1b3
    )

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-p0"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.3.0-p0.tar.gz"
    SHA1
    3621fc665397f07c57d1c77ac4d85d4634f18d3a
    )

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-p1"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.3.0-p1.tar.gz"
    SHA1
    3b42c415f6f6f197768857d12ba44f77e9f1fc50
)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-p2"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.3.0-p2.tar.gz"
    SHA1
    980c5b788849da9e8429e8f57a10569620b2fa07
)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-p3"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.3.0-p3.tar.gz"
    SHA1
    76b9d007591ac1464c443066f4e9db1a0b973efc
)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-p4"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.3.0-p4.tar.gz"
    SHA1
    455c97ea01a1b78ae39a72d00d86eb1c455e0dca
)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.3.0-f9923e9-p0"
    URL
    "https://github.com/hunter-packages/glfw/archive/v3.3.0-f9923e9-p0.tar.gz"
    SHA1
    533debc50f12ce147d54d210408c7e33654f10a4
)

hunter_cmake_args(
    glfw
    CMAKE_ARGS
    GLFW_BUILD_EXAMPLES=OFF
    GLFW_BUILD_TESTS=OFF
    GLFW_BUILD_DOCS=OFF
    GLFW_INSTALL=ON
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glfw)
hunter_download(
    PACKAGE_NAME glfw
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    # Patching of glfw3Targets.cmake required as it has full paths due to the lack
    # of imported targets for x11 packages. This should be removed when
    # https://github.com/ruslo/hunter/issues/486 is implemented
      "lib/cmake/glfw3/glfw3Targets.cmake"
      "lib/pkgconfig/glfw3.pc"

)

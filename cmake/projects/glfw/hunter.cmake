# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

if(EMSCRIPTEN)
  return()
endif()

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

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


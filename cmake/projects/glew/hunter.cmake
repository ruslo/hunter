# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(EMSCRIPTEN)
  return()
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    glew
    VERSION
    "2.0.0"
    URL
    "https://github.com/hunter-packages/glew/archive/2.0.0-p0.tar.gz"
    SHA1
    4355b4a89e11a4ce575b7b4858bfe7511be53b36
)

hunter_add_version(
    PACKAGE_NAME
    glew
    VERSION
    "2.0.0-p1"
    URL
    "https://github.com/hunter-packages/glew/archive/v2.0.0-p1.tar.gz"
    SHA1
    6a305e0cd0b2b4f02cc82809ba7e258c427ff36b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glew)
hunter_download(
    PACKAGE_NAME glew
    # Patching of glewTargets.cmake required as it has full paths due to the lack
    # of imported targets for x11 packages. This should be removed when
    # https://github.com/ruslo/hunter/issues/486 is implemented
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/cmake/glew/glewTargets.cmake"
)

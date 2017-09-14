Autotools
=========

Very often, you will come across a package that uses autotools as its build
system and does not support CMake builds. Although hunter prefers CMake builds
when possible, it does support autotools projects when no CMake build is
available. Here is how to do it.

.. code-block:: cmake

    # !!! DO NOT PLACE HEADER GUARDS HERE !!!

    include(hunter_add_version)
    include(hunter_configuration_types)
    include(hunter_pick_scheme)
    include(hunter_download)

    # If cacheable:
    include(hunter_cacheable)

    # For customization:
    include(hunter_cmake_args)

    hunter_add_version(
        PACKAGE_NAME
        Foo
        VERSION
        "1.2.3"
        URL
        "https://example.com/foo-1.2.3.tar.gz"
        SHA1
        da39a3ee5e6b4b0d3255bfef95601890afd80709
    )

    # More versions...

    # Optional platform customization.
    if (ANDROID OR IOS)
      hunter_cmake_args(
          Foo
          CMAKE_ARGS
              EXTRA_FLAGS=--enable-x
      )
    endif()

    hunter_configuration_types(Foo CONFIGURATION_TYPES Release)
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
    hunter_cacheable(Foo)
    hunter_download(PACKAGE_NAME Foo)

Note that the build may not be cacheable if autotools generation expands
absolute paths. Try using ``hunter_cacheable`` and see if it works.

**Important**: this build will not provide any CMake config. Therefore, projects
using autotools **must provide a file ``FindFoo.cmake`` in the ``cmake/find``
directory**. Dependent projects will use code similar to the following:

.. code-block:: cmake

    hunter_add_package(foo)
    find_package(foo REQUIRED)
    add_executable(bar ${BAR_SOURCES})
    target_include_directories(bar ${FOO_INCLUDE_DIRS})
    target_link_libraries(bar ${FOO_LIBRARIES})

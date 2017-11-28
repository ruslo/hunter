.. spelling::

    Autotools
    autotools
    foo


Autotools
=========

Very often, you will come across a package that uses autotools as its build
system and does not support CMake builds. Although Hunter prefers CMake builds
when possible, it does support autotools projects when no CMake build is
available. Here is how to do it.

.. code-block:: cmake

    # !!! DO NOT PLACE HEADER GUARDS HERE !!!

    include(hunter_add_version)
    include(hunter_configuration_types)
    include(hunter_pick_scheme)
    include(hunter_download)
    include(hunter_cacheable)
    include(hunter_cmake_args)

    hunter_add_version(
        PACKAGE_NAME
        foo
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
          foo
          CMAKE_ARGS
              EXTRA_FLAGS=--enable-x
      )
    endif()

    hunter_configuration_types(foo CONFIGURATION_TYPES Release)
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
    hunter_cacheable(foo)
    hunter_download(PACKAGE_NAME foo)

Note that the build may not be cacheable if autotools generation expands
absolute paths. Try using ``hunter_cacheable`` and see if it works.

Many autotools projects generate pkg-config files. These can be used
to generate a CMake config. For example, consider using the following in your
package's ``hunter.cmake`` file:

.. code-block:: cmake

    hunter_cmake_args(
        foo
        CMAKE_ARGS
            PKGCONFIG_EXPORT_TARGETS=foo
    )

In the above example, package ``foo`` generates a file ``foo.pc`` in the
autotools build. Hunter then uses ``foo.pc`` to generate a CMake config file
``fooConfig.cmake``. Now, our dependent project ``Bar`` has a much simpler
``CMakeLists.txt``:

.. code-block:: cmake

    hunter_add_package(foo)
    find_package(foo CONFIG REQUIRED)
    add_executable(bar ${BAR_SOURCES})
    target_link_libraries(bar PUBLIC PkgConfig::foo)

When following this pkg-config practice and attempting to keep ``foo``
cacheable, you must add this piece of code to your package's ``hunter.cmake``:

.. code-block:: cmake

    hunter_download(PACKAGE_NAME foo
        PACKAGE_INTERNAL_DEPS_ID "1"  # Increment for each new pull request
        PACKAGE_UNRELOCATABLE_TEXT_FILES
        lib/pkgconfig/foo.pc)

The pkg-config files will probably need to be patched so that they do not point
to the directory they are initially installed into.
``PACKAGE_UNRELOCATABLE_TEXT_FILES`` identifies these files for Hunter to patch.

If the autotools build does not produce a pkg-config output file, you must
add ``Findfoo.cmake`` place it in the ``cmake/find`` directory so Hunter can
find the package. This script should also provide import targets for dependent
builds, such that linking against ``foo::foo`` pulls in the foo includes and
libraries. In this case, dependent projects will use code similar to the following:

.. code-block:: cmake

    hunter_add_package(foo)
    find_package(foo REQUIRED)
    add_executable(bar ${BAR_SOURCES})
    target_link_libraries(bar PUBLIC foo::foo)

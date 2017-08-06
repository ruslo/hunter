.. Copyright (c) 2016-2017, Ruslan Baratov
.. All rights reserved.

Backward compatibility
----------------------

Turn Hunter off by adding one option `HUNTER_ENABLED=NO`_ to use your old
settings. For example:

.. code-block:: cmake
  :emphasize-lines: 3

    add_executable(foo openssl-example.cpp)

    hunter_add_package(OpenSSL)
    find_package(OpenSSL REQUIRED)
    target_link_libraries(foo PUBLIC OpenSSL::SSL OpenSSL::Crypto)

by default this code will trigger download and build of OpenSSL:

.. code-block:: bash
  :emphasize-lines: 9-10

  > rm -rf _builds
  > cmake -H. -B_builds -DCMAKE_VERBOSE_MAKEFILE=YES
  > cmake --build _builds

  /usr/bin/c++
      CMakeFiles/foo.dir/openssl-example.cpp.o
      -o foo
      -rdynamic
      /.../_Base/a9bd96a/e8394c3/dd69ac4/Install/lib/libssl.a
      /.../_Base/a9bd96a/e8394c3/dd69ac4/Install/lib/libcrypto.a
      -ldl

but adding ``HUNTER_ENABLED=NO`` make it skip all Hunter instructions and
system library will be used instead:

.. code-block:: bash
  :emphasize-lines: 2, 9-10

  > rm -rf _builds
  > cmake -H. -B_builds -DCMAKE_VERBOSE_MAKEFILE=YES -DHUNTER_ENABLED=NO
  > cmake --build _builds

  /usr/bin/c++
      CMakeFiles/foo.dir/openssl-example.cpp.o
      -o foo
      -rdynamic
      /usr/lib/x86_64-linux-gnu/libssl.so
      /usr/lib/x86_64-linux-gnu/libcrypto.so

``HUNTER_ENABLED=NO`` can be set by default using CMake ``option``:

.. code-block:: cmake
  :emphasize-lines: 2

  # before HunterGate
  option(HUNTER_ENABLED "Enable Hunter package manager" NO)
  HunterGate(URL ... SHA1 ...)

So this makes it easy to use Hunter as experimental feature. All information
that users need to know about new commands is that ``hunter_add_package`` and
``HunterGate`` will do nothing as long as ``HUNTER_ENABLED`` is ``NO``.

Note that Hunter itself add ``HUNTER_ENABLED=YES`` while building third party
package. It means that if package released with ``HUNTER_ENABLED=NO`` by default
it still can be used in Hunter, no extra modifications needed.

.. _HUNTER_ENABLED=NO: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_enabled

Helper modules
==============

Not all packages have the same CMake usage API. E.g. for CURL in Hunter
there is imported target ``CURL::libcurl`` but there are only
``CURL_INCLUDE_DIRS`` and ``CURL_LIBRARIES`` defined in standard ``FindCURL``
module.

To mimic Hunter API `disabled-mode <https://github.com/hunter-packages/disabled-mode>`__
modules can be used.

``HunterGate`` will load them automatically when ``HUNTER_ENABLED=OFF`` and
they are located in ``${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/disabled-mode``:

.. code-block:: none

  > cmake -H. -B_builds -DHUNTER_ENABLED=NO -DHUNTER_STATUS_DEBUG=ON
  -- [hunter *** DEBUG *** ...] Adding "disabled-mode" modules: /.../cmake/Hunter/disabled-mode

Module ``CURLConfig`` from "disabled-mode" modules will be added to CMake
search path, loaded, call standard ``FindCURL`` and create imported target
``CURL::libcurl``. This will allow to use same API with and without Hunter:

.. code-block:: cmake

  hunter_add_package(CURL)
  find_package(CURL CONFIG REQUIRED)
  target_link_libraries(foo PUBLIC CURL::libcurl)

.. admonition:: Examples on GitHub

  * `Disabled mode example <https://github.com/forexample/hunter-with-disabled-mode-example>`__

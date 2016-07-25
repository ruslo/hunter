Backward compatibility
----------------------

Turn Hunter off by adding one option `HUNTER_ENABLED=NO`_ to use your old
settings. For example:

.. code-block:: cmake
  :emphasize-lines: 1

    hunter_add_package(OpenSSL)

    find_package(OpenSSL REQUIRED)
    include_directories("${OPENSSL_INCLUDE_DIR}")

    add_executable(foo openssl-example.cpp)
    target_link_libraries(foo ${OPENSSL_LIBRARIES})

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
      -lssl
      -lcrypto

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

.. warning::

  Using old-style ``FOO_LIBRARIES`` variable instead of imported ``Foo::foo``
  targets will make your project nonrelocatable because of full paths, so
  probably you have to change this code to ``Foo::foo`` anyway.

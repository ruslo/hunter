.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. _cmake-with-deps:

CMake (with dependencies)
-------------------------

If your project uses external packages (i.e. has command ``find_package(Foo)``)
you need to patch it first so these packages can be found in the Hunter root
directory instead of the standard one:

.. code-block:: cmake
  :emphasize-lines: 1

  hunter_add_package(Foo)
  find_package(Foo)

.. note::

  * :doc:`Patching sources (hunter-packages) </creating-new/patch>`

.. _dependencies conflict:

Conflict
========

Without the ``hunter_add_package(Foo)`` call one package will be found in the
standard location and another one in the Hunter root directory. The found
packages may may conflict with each other.

Consider the next example: Project ``Roo`` is not aware about Hunter custom
locations. It's just using regular ``find_package``:

.. code-block:: cmake

  # Roo/CMakeLists.txt

  find_package(ZLIB)

Project ``Bar`` depends on ``ZLIB`` and ``Roo``. Both packages are downloaded by
``hunter_add_package`` commands:

.. code-block:: cmake
  :emphasize-lines: 3, 6

  # Bar/CMakeLists.txt

  hunter_add_package(Roo)
  find_package(Roo)

  hunter_add_package(ZLIB)
  find_package(ZLIB)

.. image:: /images/package-conflict.png
  :align: center

Fix
===

To fix this issue you need to patch project ``Roo`` so it will use ``ZLIB`` from Hunter.
In terms of CMake code it means adding ``HunterGate`` and ``hunter_add_package``
(see :doc:`First Step </quick-start/boost-components>`):

.. code-block:: cmake
  :emphasize-lines: 4-5

  # Roo/CMakeLists.txt

  include("cmake/HunterGate.cmake")
  HunterGate(...)
  hunter_add_package(ZLIB)
  find_package(ZLIB CONFIG REQUIRED)

.. image:: /images/package-conflict-resolved.png
  :align: center

Note that now the main project ``Bar`` and the hunter dependency ``Roo`` contain
a ``HunterGate`` command. The URL and SHA1 of the ``HunterGate`` command my not match.
In this case the URL and SHA1 of the main project ``Bar`` are used for both
``HunterGate`` commands. The user does not need to manage them manually.
The same is true for sub-projects added by ``add_subdirectory`` calls.

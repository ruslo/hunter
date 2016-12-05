.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

CMake (with dependencies)
-------------------------

If your project uses external packages (i.e. has command ``find_package(Foo)``)
you need to patch it first so these packages can be found in the Hunter root
directory instead of the standard one:

.. code-block:: cmake
  :emphasize-lines: 1

  hunter_add_package(Foo)
  find_package(Foo)

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
  find_package(ZLIB)

.. image:: /images/package-conflict-resolved.png
  :align: center

Note that now the main project ``Bar`` and the hunter dependency ``Roo`` contain
a ``HunterGate`` command. The URL and SHA1 of the ``HunterGate`` command my not match.
In this case the URL and SHA1 of the main project ``Bar`` are used for both 
``HunterGate`` commands. The user doesn't need to manage them manually.
The same is true for sub-projects added by ``add_subdirectory`` calls.

Maintenance
===========

In practice patching requires to have a fork of a project.  In general it
doesn't matter where the fork is located. But it matters that there is a central place for the
patched packages:

* https://github.com/hunter-packages

If you want to create new fork let me know about it in a corresponding issue
with `"new package" label`_, I will create a new team and add you so you can
push changes. Create a new branch ``hunter`` for patching. Please
keep other branches in a **clean state** so we can always do
``git merge --ff-only`` from upstream.
Please do push commits **only related to hunterization**. Do not push general
fixes and improvements, do push them **upstream** instead. Perfect hunterization
should contain only:

* Adding ``HunterGate`` module (`example <https://github.com/hunter-packages/opencv/commit/a5d663884a186c8dfdabb9dcae92defd32d28329?diff=unified>`__)
* Including it with some URL/SHA1 (`example <https://github.com/hunter-packages/opencv/commit/f1d4605e9e50cc0e45cb74c26ce24e094ee16bc5?diff=unified>`__)
* Adding ``hunter_add_package`` commands (`example <https://github.com/hunter-packages/opencv/commit/b65ec7f719d1da17c01b154a847d2b89cfbaacb8?diff=unified>`__)

Note that I'm not willing and can't maintain all packages in practice. Therefore
I do add all developers to the team if they ask to. If you want to be
a maintainer, keep eye on changes, pull requests, be responsible for review and
releases - let me know.

Also note that Hunter is designed to have **zero maintenance** for such tasks, since
you can add ``HUNTER_ENABLED=OFF`` option at the top of the project to skip all
package management stuff (see :doc:`/overview/compatibility`).  It means you
can push branch ``hunter`` to upstream without affecting functionality of
the project. As a summary it may sounds strange, but the final goal of this
organization is to have no forks of packages at all.

.. _"new package" label: https://github.com/ruslo/hunter/issues?q=is%3Aopen+is%3Aissue+label%3A%22new+package%22

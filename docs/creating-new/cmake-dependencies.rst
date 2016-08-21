.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

CMake (with dependencies)
-------------------------

If your project use external packages (i.e. has command ``find_package(Foo)``)
you need to patch it first so this packages can be found in Hunter root
directory instead of standard one:

.. code-block:: cmake
  :emphasize-lines: 1

  hunter_add_package(Foo)
  find_package(Foo)

Conflict
========

The reason is that if one package will be found in standard location and other
in Hunter they may conflict with each other.

Consider next example. Project ``Roo`` is not aware about Hunter custom
locations. It just using regular ``find_package``:

.. code-block:: cmake

  # Roo/CMakeLists.txt

  find_package(ZLIB)

Project ``Bar`` depends on ``ZLIB`` and ``Roo``. Both packages downloaded by
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

To fix this issue you need to patch ``Roo`` so it will use ``ZLIB`` from Hunter.
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

Note that SHA1 of Hunter archive in ``HunterGate`` commands of ``Bar`` and
``Roo`` can be different. Same location will be set automatically internally
you don't have to manage it manually.

Maintenance
===========

On practice patching require to have a fork of a project.  In general it
doesn't matter where fork is located but there is a central place for the
patched packages:

* https://github.com/hunter-packages

If you want to create new fork let me know about it in corresponding issue
with `"new package" label`_, I will create a new team and add you so you can
push changed. New branch ``hunter`` will be created for patching, please
keep other branches in a **clean state** so we can always do
``git merge --ff-only`` from upstream.
Please do push commits **only related to hunterization**. Do not push general
fixes and improvements, do push them **upstream** instead. Perfect hunterization
should contains only:

* Adding ``HunterGate`` module (`example <https://github.com/hunter-packages/opencv/commit/a5d663884a186c8dfdabb9dcae92defd32d28329?diff=unified>`__)
* Including it with some URL/SHA1 (`example <https://github.com/hunter-packages/opencv/commit/f1d4605e9e50cc0e45cb74c26ce24e094ee16bc5?diff=unified>`__)
* Adding ``hunter_add_package`` commands (`example <https://github.com/hunter-packages/opencv/commit/b65ec7f719d1da17c01b154a847d2b89cfbaacb8?diff=unified>`__)

Note that I'm not willing and can't do maintain all packages on practice so
I do add all developers to the team if they ask to. If you want to be
a maintainer, keep eye on changes, pull requests, be responsible for review and
releases - let me know.

Also note that Hunter designed to have **zero maintenance** for such task since
you can add ``HUNTER_ENABLED=OFF`` option at the top of the project to skip all
package management stuff (see :doc:`/overview/compatibility`).  It means you
can push branch ``hunter`` to upstream without affecting functionality of
the project. As a summary it may sounds strange but the final goal of this
organization is to have no packages at all.

.. _"new package" label: https://github.com/ruslo/hunter/issues?q=is%3Aopen+is%3Aissue+label%3A%22new+package%22

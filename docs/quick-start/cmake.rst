.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Notes about version of CMake
----------------------------

* `3.2.0`_ **Minimum required**

  * New ``continue`` command
  * New synchronization command ``file(LOCK ...)``

* `3.4.1`_

  * **Buggy**, see `issue #405 <https://github.com/ruslo/hunter/issues/405>`__

* `3.5.0`_ **Minimum for iOS projects**

  * New variable `CMAKE_IOS_INSTALL_COMBINED <https://cmake.org/cmake/help/v3.5/variable/CMAKE_IOS_INSTALL_COMBINED.html>`__
  * `iOS toolchains <http://polly.readthedocs.io/en/latest/toolchains/ios.html>`__

* `3.7.0`_

  * Minimum version for packages with
    :doc:`protected sources </user-guides/cmake-user/protected-sources>`
  * ``USERPWD`` sub-option for ``file(DOWNLOAD|UPLOAD ...)``
  * ``HTTP_{USERNAME|PASSWORD}`` sub-options for ``ExternalProject_Add``
  * List of URLs can be passed to ``ExternalProject_Add``.
    Used by :ref:`hunter download server`.

* `3.7.1`_ **Minimum for Android projects**

  * CMake now supports Cross Compiling for Android with simple toolchain files
  * `Polly Android toolchains <http://polly.readthedocs.io/en/latest/toolchains/android.html#android-ndk-x-api-y>`__

.. tip::

  * `CMake milestones <https://gitlab.kitware.com/cmake/cmake/milestones?state=all>`__ (`old version <https://cmake.org/Bug/changelog_page.php>`__)

.. note::

  In theory CMake 3.0 can be used with Hunter versions before v0.22 but in
  practice you have to work with v0.14.3 because ``continue`` added to
  v0.14.4 code.

.. note::

  Latest Hunter release with support of old Android toolchains
  (before CMake 3.7.1) is v0.16.36

.. _3.2.0: https://www.cmake.org/cmake/help/v3.2/release/3.2.html#commands
.. _3.4.1: https://www.cmake.org/cmake/help/v3.4/release/3.4.html
.. _3.5.0: https://www.cmake.org/cmake/help/v3.5/release/3.5.html#platforms
.. _3.7.0: https://cmake.org/cmake/help/latest/release/3.7.html#commands
.. _3.7.1: https://cmake.org/cmake/help/latest/release/3.7.html#platforms

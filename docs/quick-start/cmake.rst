Notes about version of CMake
----------------------------

* `3.0.0`_ **Minimum required**

  * **Buggy**, see `PR #198`_
  * Interface header-only libraries
  * Sub-option ``VERSION`` for command ``project``
  * New MSVC generator names

* `3.1.0`_

  * **Buggy**, see `issue #105`_
  * Retry download on hash mismatch (`change <https://github.com/Kitware/CMake/commit/30a94eecdb5c580d83a224848b78d186643e8105>`__)
  * New `CMP0054`_ (best CMake policy!) See `this SO question`_

* `3.2.0`_

  * New synchronization command ``file(LOCK ...)`` (`change <https://github.com/Kitware/CMake/commit/e6db4c5a4ede8039ed525e3facebd7e0eb7ec1b7>`__)
  * `HUNTER_SKIP_LOCK`_

* `3.5.0`_ **Minimum for iOS projects**

  * New variable `CMAKE_IOS_INSTALL_COMBINED`_ (`change <https://github.com/Kitware/CMake/commit/565d080a9a1e133bda868e905226181b60e90356>`__)
  * `iOS toolchains`_

.. _3.0.0: http://www.cmake.org/cmake/help/v3.0/release/3.0.0.html#commands
.. _3.1.0: http://www.cmake.org/cmake/help/v3.1/release/3.1.0.html#syntax
.. _3.2.0: http://www.cmake.org/cmake/help/v3.2/release/3.2.html#commands
.. _3.5.0: https://cmake.org/cmake/help/v3.5/release/3.5.html#platforms

.. _CMP0054: http://www.cmake.org/cmake/help/v3.1/policy/CMP0054.html

.. _PR #198: https://github.com/ruslo/hunter/pull/198#issuecomment-120630877
.. _issue #105: https://github.com/ruslo/hunter/issues/105

.. _this SO question: http://stackoverflow.com/questions/19982340

.. _HUNTER_SKIP_LOCK: https://github.com/ruslo/hunter/wiki/error.can.not.lock
.. _CMAKE_IOS_INSTALL_COMBINED: https://cmake.org/cmake/help/v3.5/variable/CMAKE_IOS_INSTALL_COMBINED.html

.. _iOS toolchains: https://github.com/ruslo/polly/wiki/Toolchain-list#ios

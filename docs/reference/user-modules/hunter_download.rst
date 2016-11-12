.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_download
---------------

* `Source <https://github.com/ruslo/hunter/blob/develop/cmake/modules/hunter_download.cmake>`__
* Usage examples:

 * `PACKAGE_NAME <https://github.com/ruslo/hunter/blob/71daf403edd1cc870452ae7bf5c8e873c6d6398c/cmake/projects/GTest/hunter.cmake#L138>`__
 * `PACKAGE_COMPONENT <https://github.com/ruslo/hunter/blob/71daf403edd1cc870452ae7bf5c8e873c6d6398c/cmake/projects/Boost/atomic/hunter.cmake#L20>`__
 * `PACKAGE_DEPENDS_ON <https://github.com/ruslo/hunter/blob/71daf403edd1cc870452ae7bf5c8e873c6d6398c/cmake/projects/LLVM/hunter.cmake#L76>`__
 * `PACKAGE_INTERNAL_DEPS_ID <https://github.com/ruslo/hunter/blob/71daf403edd1cc870452ae7bf5c8e873c6d6398c/cmake/projects/Qt/qt3d/hunter.cmake#L14>`__

Final stage of adding package to the project. This command will read all
package related variables and start the real download/build (or cache unpack)
instructions. Name of package and component set by ``PACKAGE_NAME`` and
``PACKAGE_COMPONENT``.

Option ``PACKAGE_DEPENDS_ON`` used to register dependency explicitly (this is a
**workaround** for non-hunterized packages and **should not be used**).
Note that dependencies tracked automatically in Hunter. Also note that this will
only register dependency without downloading it and in fact used only for
unpacking archives of ``Cache`` directory.

Option ``PACKAGE_INTERNAL_DEPS_ID`` is an identifier of internal files that build
the package (like build scheme or additional scripts). This variable used by
cache system to detect the necessity of update the binary cache of
package when non of the following changed: package sources, build types,
cmake arguments, toolchain-id or dependencies. The rule of thumb is to increase
the value of ``PACKAGE_INTERNAL_DEPS_ID`` each time you're applying change of
build scheme and making it public (e.g. sending pull request). This should be
done for every affected package. If you want to understand the meaning of it
better and why such approach used, you can read:

* `Issue #74 (Binaries cache) <https://github.com/ruslo/hunter/issues/74>`__
* `Issue #194 (Correct reusing of cache directory) <https://github.com/ruslo/hunter/issues/194>`__

.. note::

  This variable used only by non-CMake packages since CMake-based packages
  build in a standard way by ``url_sha1_cmake`` scheme.

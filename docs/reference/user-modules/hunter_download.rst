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
workaround for non-hunterized packages). Note that dependencies tracked
automatically in Hunter. Also note that this will only register dependency
without downloading it and in fact used only for unpacking archives of ``Cache``
directory.

Option ``PACKAGE_INTERNAL_DEPS_ID`` is an identifier of internal files that build
the package (like build scheme or additional scripts). Usually there is no need
to set this variable, take a look at this issues if you want to understand the
meaning of it: `binaries cache <https://github.com/ruslo/hunter/issues/74>`__ and
`correct reusing of cache directory <https://github.com/ruslo/hunter/issues/194>`__.

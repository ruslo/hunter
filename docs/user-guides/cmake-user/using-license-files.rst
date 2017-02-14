.. Copyright (c) 2016-2017, Ruslan Baratov
.. All rights reserved.

Using license files
-------------------

After package was installed Hunter will search for the license file(s) in
sources. Next priority is used (see
`script <https://github.com/ruslo/hunter/blob/master/scripts/try-copy-license.cmake>`__):

* Licenses specified explicitly by `HUNTER_INSTALL_LICENSE_FILES <https://github.com/ruslo/hunter/blob/46c2b042d7fedb38cbc01c69f8b4291a5ce5bb43/cmake/projects/Eigen/hunter.cmake#L48>`__

* Default names (only first found used):

  * ``LICENSE``
  * ``LICENSE.txt``
  * ``COPYING``
  * ``COPYING.txt``
  * ``license``
  * ``license.txt``
  * ``copying``
  * ``copying.txt``

* Files found by command ``file(GLOB ... "${package_source_dir}/LICENSE*")``

In case search was successful variable ``<PACKAGE>_LICENSES`` can be used to
obtain full paths to the licenses
(`example <https://github.com/ruslo/hunter/blob/master/examples/Boost/CMakeLists.txt>`__):

.. code-block:: cmake

  hunter_add_package(Boost)

  set(project_license "${CMAKE_CURRENT_BINARY_DIR}/LICENSE.txt")
  file(
      WRITE
      "${project_license}"
      "Some info about this project license.\n\n"
  )

  string(COMPARE EQUAL "${Boost_LICENSES}" "" is_empty)
  if(is_empty)
    message(FATAL_ERROR "No licenses")
  endif()

  file(APPEND "${project_license}" "== 3rd party licenses ==\n\n")

  foreach(x ${Boost_LICENSES})
    file(READ "${x}" content)
    get_filename_component(license_name "${x}" NAME)
    file(APPEND "${project_license}" "== Boost (${license_name}) ==\n\n")
    file(APPEND "${project_license}" "${content}")
  endforeach()

.. warning::

  For Hunter version ``< v0.18.0``:

  * ``HUNTER_INSTALL_LICENSE_FILES`` not used
  * The ``*_LICENSE`` variable should be used instead of ``*_LICENSES``
  * ``*_LICENSE`` contains only of one file (it's not a list)

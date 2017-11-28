.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. _contributing:

Contributing
------------

There are many ways to contribute to Hunter:

- Documentation
- There is a newer version of an existing package? `Notify us <https://github.com/ruslo/hunter/issues>`__ or send a pull request with an updated version.
- Missing a package in Hunter? :ref:`Add a new package <creating new>`
- `Resolve Issues <https://github.com/ruslo/hunter/issues>`__

  - Can you provide an answer to an open question?
  - Can you reproduce the error?
  - Is the issue still relevant? Maybe the issue can be closed.

When contributing please follow the style guides:

- `Git <http://0.readthedocs.org/en/latest/git.html>`__
- `CMake <http://0.readthedocs.org/en/latest/cmake.html>`__

.. note::

     The minimum version of CMake for using Hunter is ``3.0``.
     Please check that you're not using commands from newer versions
     (`see documentation for 3.0 <http://www.cmake.org/cmake/help/v3.0/>`__).

.. note::

    Before adding or updating a package in Hunter, the package is tested.
    Tests are done to check if the source can be downloaded, built and linked.
    Head over to our
    `repository for per package CI testing contribution <https://github.com/ingenue/hunter>`__
    to see more.

Reporting bugs
~~~~~~~~~~~~~~

Hunter is CMake-based package manager so it's assumed that CMake is installed
and working correctly. Before reporting bugs please check:

* Appropriate version of CMake is installed.
  See :doc:`CMake version for Hunter </quick-start/cmake>`.

* Verify CMake, build tools and C/C++ compilers you're planning to use.
  Try to build simple CMake project (check
  `this document <http://cgold.readthedocs.io/en/latest/first-step.html>`__
  in case you have troubles):

  .. code-block:: cmake

    # CMakeLists.txt

    cmake_minimum_required(VERSION 3.0)
    project(foo)

    add_executable(foo foo.cpp)

  .. code-block:: cpp

    // foo.cpp

    #include <iostream>

    int main() {
      std::cout << "Hello world!" << std::endl;
    }

* Most sources downloaded by HTTPS protocol so CMake should be build with
  CURL with enabled OpenSSL. Without HTTPS support you will see this error:

  .. code-block:: none

    error: downloading
    'https://...' failed

      status_code: 1
      status_string: "Unsupported protocol"
      log: Protocol "https" not supported or disabled in libcurl

    Closing connection -1

  .. note::

    * `Example of building CMake with CURL + OpenSSL <https://github.com/ruslo/hunter/issues/328#issuecomment-198672048>`__

If everything seems OK:

* Run build again with :ref:`HUNTER_STATUS_DEBUG=ON <hunter_status_debug>`
* Take a look at **first** error reported by Hunter. If Hunter reports chain
  of errors the last error you see is **not relevant**!
* Update to `latest Hunter URL/SHA1 <https://github.com/ruslo/hunter/releases>`__
  and check that issue you have hit is not already fixed/reported
* Open an `issue <https://github.com/ruslo/hunter/issues/new>`__ and provide
  next info:

  * CMake version you're using ``cmake --version``. CMake build from source?
  * OS (Linux, OSX, Windows)
  * Command line you're using on generate step (e.g. ``cmake -H. -B_builds "-GVisual Studio 14 2015"``)
  * Add log until **first error** reported by Hunter

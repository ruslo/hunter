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
    `repository for per package CI testing contribution <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=pkg.>`__
    to see more.

.. note::

  If you're planning to introduce nontrivial feature it's better to
  discuss design first, it will save a lot of time for both you and developers.

Reporting bugs
~~~~~~~~~~~~~~

Hunter is CMake-based package manager so it's assumed that CMake is installed
and working correctly. Before reporting bugs please check:

* Appropriate version of CMake is installed.
  See :doc:`CMake version for Hunter </quick-start/cmake>`.

* Verify CMake, build tools and C/C++ compilers you're planning to use.
  E.g. try to build simple CMake project (check
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

* If you are experiencing some download error please check F.A.Q.:
  :doc:`How to fix download error? </faq/how-to-fix-download-error>`

If everything seems OK:

* Run build again with :ref:`HUNTER_STATUS_DEBUG=ON <hunter_status_debug>`
* Make sure you're not using :ref:`HUNTER_NO_TOOLCHAIN_ID_RECALCULATION <hunter no toolchain id recalculation>`
* Take a look at **first** error reported by Hunter. If Hunter reports chain
  of errors the last error you see is **not relevant**!
* Update to `latest Hunter URL/SHA1 <https://github.com/ruslo/hunter/releases>`__
  and check that issue you have hit is not already fixed/reported
* Check this document if the first error you see is ``external.build.failed``:

  * https://docs.hunter.sh/en/latest/reference/errors/error.external.build.failed.html
* Remove irrelevant code from your example and report one problem at a time.
  Try to construct `SSCCE <http://www.sscce.org/>`__. If you need more files
  than just ``CMakeLists.txt`` it's better to create separate GitHub repository
  for easy copying of your example. It will be nice if you can reproduce the
  issue with the CI system like AppVeyor/Travis.

* **Do not remove** ``~/.hunter`` repository to try to fix the issue! Hunter
  designed to be correct and reproducible, there should be no stale/rotten
  artifacts inside that can affect his work. If the ``rm -rf ~/.hunter`` step
  fix the issue for you it means that either you are using Hunter wrongly or
  there is a bug somewhere. If you want to figure out what is the origin
  of the problem please do keep ``~/.hunter`` directory.

* Open an `issue <https://github.com/ruslo/hunter/issues/new>`__ and provide
  next info:

  * CMake version you're using ``cmake --version``. CMake build from source?
  * OS (Linux, OSX, Windows)
  * Command line you're using on generate step, e.g.

    .. code-block:: none

      cmake -H. -B_builds "-GVisual Studio 14 2015"

  * Are you using toolchain?
  * Add log until **first error** reported by Hunter

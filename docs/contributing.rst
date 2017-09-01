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

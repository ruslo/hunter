.. spelling::

    fmt

.. index:: logging ; fmt

.. _pkg.fmt:

fmt
===

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.14.22-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.14.22
  :alt: Hunter v0.14.22

-  `Official <https://github.com/fmtlib/fmt>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/fmt/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `Dmitry Panteleev <https://github.com/dpantele>`__
   (`pr-413 <https://github.com/ruslo/hunter/pull/413>`__)
-  `Testing
   branch <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=fmt>`__

.. code-block:: cmake

    hunter_add_package(fmt)

    find_package(fmt CONFIG REQUIRED)

    # or fmt-header-only
    target_link_libraries(... fmt)

Bugs
----

-  Looks like on Android the ``<clocale>`` API is not implemented, so
   ```{:n}`` formatter <https://github.com/fmtlib/fmt/issues/305>`__
   does not work, see https://github.com/fmtlib/fmt/issues/327

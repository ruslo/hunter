.. spelling::

    doctest

.. index:: unsorted ; doctest

.. _pkg.doctest:

doctest
=======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.18.29-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.18.29
  :alt: Hunter v0.18.29

-  `Official <https://github.com/onqtam/doctest>`__
-  `Hunterized <https://github.com/piribes/doctest>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(doctest)
    find_package(doctest CONFIG REQUIRED)
    target_link_libraries(... doctest::doctest)

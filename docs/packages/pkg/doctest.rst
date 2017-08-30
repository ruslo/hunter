.. spelling::

    doctest

.. index:: unsorted ; doctest

.. _pkg.doctest:

doctest
=======

-  `Official <https://github.com/onqtam/doctest>`__
-  `Hunterized <https://github.com/piribes/doctest>`__
-  Available since `v0.18.29 <https://github.com/ruslo/hunter/releases/tag/v0.18.29>`__

.. code-block:: cmake

    hunter_add_package(doctest)
    find_package(doctest CONFIG REQUIRED)
    target_link_libraries(... doctest::doctest)

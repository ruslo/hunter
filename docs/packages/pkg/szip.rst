.. spelling::

    szip

.. index:: compression ; szip

.. _pkg.szip:

szip
====

-  `Hunterized <https://github.com/hunter-packages/szip>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/szip/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(szip)
    find_package(szip REQUIRED)

    target_link_libraries(... szip::szip)

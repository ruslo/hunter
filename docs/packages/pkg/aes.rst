.. spelling::

    aes

.. index:: unsorted ; aes

.. _pkg.aes:

aes
===

-  `Official <https://github.com/kokke/tiny-AES128-C>`__
-  `Hunterized <https://github.com/hunter-packages/aes>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/aes/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(aes)
    find_package(aes CONFIG REQUIRED)
    target_link_libraries(... aes::aes)

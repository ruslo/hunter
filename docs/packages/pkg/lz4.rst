.. spelling::

    lz

.. index:: compression ; lz4

.. _pkg.lz4:

lz4
===

-  http://www.lz4.org
-  `Official GitHub <https://github.com/lz4/lz4>`__
-  `Hunterized <https://github.com/hunter-packages/lz4>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/lz4/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(lz4)
    find_package(lz4 CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC lz4::lz4)

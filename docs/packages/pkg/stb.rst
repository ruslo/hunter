.. spelling::

    stb

.. index:: unsorted ; stb

.. _pkg.stb:

stb
===

-  `Official <https://github.com/nothings/stb>`__
-  `Hunterized <https://github.com/hunter-packages/stb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/stb/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(stb)
    find_package(stb CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC stb::stb)

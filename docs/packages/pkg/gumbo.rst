.. spelling::

    gumbo

.. index:: serialization ; gumbo

.. _pkg.gumbo:

gumbo
=====

-  `Official <https://github.com/gumbo/gumbo>`__
-  `Hunterized <https://github.com/isaachier/gumbo>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gumbo/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(gumbo)
    find_package(gumbo CONFIG REQUIRED)
    target_link_libraries(... gumbo::gumbo)

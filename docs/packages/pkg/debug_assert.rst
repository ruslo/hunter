.. spelling::

    debug_assert

.. index:: unsorted ; debug_assert

.. _pkg.debug_assert:

debug_assert
===

-  `Official <https://github.com/foonathan/debug_assert>`__
-  `Hunterized <https://github.com/hunter-packages/debug_assert>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/debug_assert/CMakeLists.txt>`__
-  Added by `dvirtz <https://github.com/dvirtz>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(debug_assert)
    find_package(debug_assert CONFIG REQUIRED)
    target_link_libraries(debug_assert_example debug_assert)

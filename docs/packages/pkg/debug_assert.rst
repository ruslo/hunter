.. spelling::

    debug_assert

.. index:: unsorted ; debug_assert

.. _pkg.debug_assert:

debug_assert
============

-  `Official <https://github.com/foonathan/debug_assert>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/debug_assert/CMakeLists.txt>`__
-  Added by `dvirtz <https://github.com/dvirtz>`__ (`pr-1127 <https://github.com/ruslo/hunter/pull/1127>`__)

.. code-block:: cmake

    hunter_add_package(debug_assert)
    find_package(debug_assert CONFIG REQUIRED)
    target_link_libraries(debug_assert_example debug_assert)

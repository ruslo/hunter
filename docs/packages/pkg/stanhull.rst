.. spelling::

    stanhull

.. index:: unsorted ; stanhull

.. _pkg.stanhull:

stanhull
========

- `Hunterized <https://github.com/hunter-packages/stanhull>`__
- `Example <https://github.com/ruslo/hunter/blob/master/examples/stanhull/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(stanhull)
    find_package(stanhull CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC stanhull::stanhull)

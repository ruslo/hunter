.. spelling::

    re

.. index:: unsorted ; re2

.. _pkg.re2:

re2
===

-  `Official <https://github.com/google/re2>`__
-  `Hunterized <https://github.com/hunter-packages/re2>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/re2/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1171 <https://github.com/ruslo/hunter/pull/1171>`__)

.. code-block:: cmake

    hunter_add_package(re2)
    find_package(RE2 CONFIG REQUIRED)
    target_link_libraries(foo RE2::re2)

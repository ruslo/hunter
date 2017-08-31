.. spelling::

    Async

.. _pkg.Async++:

Async++
=======

-  `Official <https://github.com/Amanieu/asyncplusplus>`__
-  `Hunterized <https://github.com/hunter-packages/asyncplusplus>`__
-  Available since
   `v0.12.28 <https://github.com/ruslo/hunter/releases/tag/v0.12.28>`__
-  Added by `Andrei Laphin <https://github.com/alapshin>`__
   (`pr-268 <https://github.com/ruslo/hunter/pull/268>`__)

.. code-block:: cmake

    hunter_add_package(Async++)
    find_package(Async++ CONFIG REQUIRED)

    target_link_libraries(... Async++::Async++)

.. spelling::

    Catch

.. index:: testing ; Catch

.. _pkg.Catch:

Catch
=====

-  `Official <https://github.com/philsquared/Catch>`__
-  `Hunterized <https://github.com/hunter-packages/Catch>`__
-  Available since
   `v0.17.6 <https://github.com/ruslo/hunter/releases/tag/v0.17.6>`__

.. code-block:: cmake

    hunter_add_package(Catch)
    find_package(Catch CONFIG REQUIRED)
    target_link_libraries(... Catch::Catch)

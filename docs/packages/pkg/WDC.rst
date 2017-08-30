.. spelling::

    WDC

.. index:: unsorted ; WDC

.. _pkg.WDC:

WDC
===

- `Official <https://github.com/CloudPolis/webdav-client-cpp>`__
- `Hunterized <https://github.com/hunter-packages/webdav-client-cpp>`__
- Available since `WDC v1.0.9 <https://github.com/CloudPolis/webdav-client-cpp/tree/v1.0.9>`__

.. code-block:: cmake

    hunter_add_package(WDC)
    find_package(WDC CONFIG REQUIRED)
    target_link_libraries(... WDC::libwdc)

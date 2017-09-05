.. spelling::

    ArrayFire

.. index:: concurrency ; ArrayFire

.. _pkg.ArrayFire:

ArrayFire
=========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.48-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.48
  :alt: Hunter v0.12.48

-  `Official <https://github.com/arrayfire/arrayfire>`__
-  `Hunterized <https://github.com/hunter-packages/arrayfire>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/yaml-cpp/CMakeLists.txt>`__
-  `Testing <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=arrayfire>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(ArrayFire)
    find_package(ArrayFire CONFIG REQUIRED)
    target_link_libraries(... ArrayFire::af)
    target_link_libraries(... ArrayFire::afcpu)

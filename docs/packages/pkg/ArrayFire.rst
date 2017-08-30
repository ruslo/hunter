.. spelling::

    ArrayFire

.. index:: concurrency ; ArrayFire

.. _pkg.ArrayFire:

ArrayFire
=========

-  `Official <https://github.com/arrayfire/arrayfire>`__
-  `Hunterized <https://github.com/hunter-packages/arrayfire>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/yaml-cpp/CMakeLists.txt>`__
-  `Testing <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=arrayfire>`__
-  Available since
   `v0.12.48 <https://github.com/ruslo/hunter/releases/tag/v0.12.48>`__

.. code-block:: cmake

    hunter_add_package(ArrayFire)
    find_package(ArrayFire CONFIG REQUIRED)
    target_link_libraries(... ArrayFire::af)
    target_link_libraries(... ArrayFire::afcpu)

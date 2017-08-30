.. spelling::

    tacopie

.. index:: unsorted ; tacopie

.. _pkg.tacopie:

tacopie
=======

-  `Official <https://github.com/Cylix/tacopie>`__
-  `Official github fork <https://github.com/Cylix/tacopie>`__
-  `Hunterized <https://github.com/hunter-packages/tacopie>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/tacopie/CMakeLists.txt>`__
-  Available since
   `v0.18.50 <https://github.com/ruslo/hunter/releases/tag/v0.18.50>`__

.. code-block:: cmake

    hunter_add_package(tacopie)
    find_package(tacopie CONFIG REQUIRED)
    target_link_libraries(... tacopie::tacopie)

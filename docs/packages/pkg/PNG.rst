.. spelling::

    PNG

.. index:: media ; PNG

.. _pkg.PNG:

PNG
===

-  `Official <http://libpng.sourceforge.net>`__
-  `Hunterized <https://github.com/hunter-packages/libpng>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/PNG/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(PNG)
    find_package(PNG CONFIG REQUIRED)

    target_link_libraries(... PRIVATE PNG::png)

Compatibility mode:

.. code-block:: cmake

    hunter_add_package(PNG)
    find_package(PNG REQUIRED)

    include_directories(${PNG_INCLUDE_DIRS})
    target_link_libraries(... ${PNG_LIBRARIES})
    add_definitons(${PNG_DEFINITIONS})

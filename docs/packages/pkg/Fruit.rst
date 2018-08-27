.. spelling::

    Google Fruit

.. index:: testing ; Fruit

.. _pkg.Fruit:

Fruit
=====

-  `Official <https://github.com/google/fruit>`__
-  `Hunterized <https://github.com/hunter-packages/fruit>`__
-  `Dev branch <https://github.com/ruslo/hunter/tree/Fruit>`__
-  `Versions <https://github.com/ruslo/hunter/blob/master/cmake/projects/Fruit/hunter.cmake>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Fruit/CMakeLists.txt>`__
-  `Added by Alexey Shevchenko <https://github.com/FelikZ>`__
   (`pr-1527 <https://github.com/ruslo/hunter/pull/1527>`__)

Note: boost disabled by default since it has issues on some platforms. Use `CMAKE_ARGS FRUIT_USES_BOOST=ON` to enable it.

.. code-block:: cmake

    find_package(Fruit 3.1 QUIET)
    if (NOT Fruit_FOUND)
        hunter_add_package(Fruit)
        find_package(Fruit 3.1 REQUIRED)
    endif()
    MESSAGE(STATUS "Fruit_VERSION: ${Fruit_VERSION}")

    target_link_libraries(foo
        Fruit::fruit
    )

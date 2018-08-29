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

.. code-block:: cmake

    hunter_add_package(Fruit)
    find_package(Fruit CONFIG REQUIRED)

    add_executable(foo foo.cpp)

    target_link_libraries(foo PRIVATE Fruit::fruit)

.. note::

    Boost disabled by default since it has issues on some platforms.

Use ``FRUIT_USES_BOOST=ON`` to enable it.

.. code-block:: cmake

    # hunter.cmake
    hunter_config(Fruit
        VERSION 3.1.1
        CMAKE_ARGS
            CMAKE_CXX_STANDARD=17
            FRUIT_USES_BOOST=ON
    )

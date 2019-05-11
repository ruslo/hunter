.. spelling::

    Fruit

.. index:: testing ; Fruit

.. _pkg.Fruit:

Fruit
=====

-  `Official <https://github.com/google/fruit>`__
-  `Hunterized <https://github.com/hunter-packages/fruit>`__
-  `Versions <https://github.com/ruslo/hunter/blob/master/cmake/projects/Fruit/hunter.cmake>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Fruit/CMakeLists.txt>`__
-  `Added by Alexey Shevchenko <https://github.com/FelikZ>`__
   (`pr-1527 <https://github.com/ruslo/hunter/pull/1527>`__)

.. literalinclude:: /../examples/Fruit/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

.. note::

    Boost disabled by default since it has issues on some platforms.

    Use ``FRUIT_USES_BOOST=ON`` to enable it.

    .. code-block:: cmake

        # config.cmake
        hunter_config(Fruit
            VERSION ${HUNTER_Fruit_VERSION}
            CMAKE_ARGS
                FRUIT_USES_BOOST=ON
        )

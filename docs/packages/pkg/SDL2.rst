.. spelling::

    SDL2

.. index:: unsorted ; SDL2

.. _pkg.SDL2:

SDL2
====

-  `Official <https://www.libsdl.org>`__
-  `Hunterized <https://github.com/hunter-packages/SDL2>`__

.. -  `__FIXME__ Example <https://github.com/ruslo/hunter/blob/master/examples/__FIXME__/CMakeLists.txt>`__
.. -  Available since `__FIXME__ vX.Y.Z <https://github.com/ruslo/hunter/releases/tag/vX.Y.Z>`__
.. -  Added by `__FIXME__ <https://github.com/__FIXME__>`__ (`__FIXME__ pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(SDL2)
    find_package(SDL2 CONFIG REQUIRED)
    #...
    target_link_libraries(... SDL2::SDL2)

Available targets: ``SDL2::SDL2``, ``SDL2::SDL2-static``, ``SDL2::SDL2main``

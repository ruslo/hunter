.. spelling::

    inja

.. index:: templating ; inja

.. _pkg.inja:

inja
====

-  `Official <https://github.com/pantor/inja>`__
-  `Hunterized <https://github.com/pantor/inja>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/inja/CMakeLists.txt>`__
-  Added by `Jorrit Wronski <https://github.com/jowr>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

Please note that C++ 11 is required, Visual Studio versions prior to 2015 are not supported since the employed JSON library requires the `noexcept` keyword.

.. code-block:: cmake

    hunter_add_package(inja)
    find_package(inja CONFIG REQUIRED)
    target_link_libraries(inja inja::inja)

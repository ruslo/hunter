.. spelling::

    inja

.. index:: templating ; inja

.. _pkg.inja:

inja
====

-  `Official <https://github.com/pantor/inja>`__
-  `Hunterized <https://github.com/jowr/inja>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/inja/CMakeLists.txt>`__
-  Added by `Jorrit Wronski <https://github.com/jowr>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(inja)
    find_package(inja CONFIG REQUIRED)
    target_link_libraries(inja inja::inja)

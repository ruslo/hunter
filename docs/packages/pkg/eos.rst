.. spelling::

    eos

.. index:: computer-vision ; eos

.. _pkg.eos:

eos
===

-  `Official GitHub <https://github.com/patrikhuber/eos>`__
-  `Hunterized <https://github.com/hunter-packages/eos>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/eos/foo.cpp>`__
-  Available since
   `v0.15.28 <https://github.com/ruslo/hunter/releases/tag/v0.15.28>`__

.. code-block:: cmake

    hunter_add_package(eos)
    find_package(eos CONFIG REQUIRED)
    target_link_libraries(... eos::eos)

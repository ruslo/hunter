.. spelling::

    eos

.. index:: computer-vision ; eos

.. _pkg.eos:

eos
===

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.15.28-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.15.28
  :alt: Hunter v0.15.28

-  `Official GitHub <https://github.com/patrikhuber/eos>`__
-  `Hunterized <https://github.com/hunter-packages/eos>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/eos/foo.cpp>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(eos)
    find_package(eos CONFIG REQUIRED)
    target_link_libraries(... eos::eos)

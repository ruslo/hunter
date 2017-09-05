.. spelling::

    FakeIt

.. index:: testing ; FakeIt

.. _pkg.FakeIt:

FakeIt
======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.18.24-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.18.24
  :alt: Hunter v0.18.24

-  `Official <https://github.com/eranpeer/FakeIt>`__
-  `Hunterized <https://github.com/hunter-packages/FakeIt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(FakeIt)
    find_package(FakeIt CONFIG REQUIRED)
    target_link_libraries(... FakeIt::FakeIt)

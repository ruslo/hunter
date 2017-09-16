.. spelling::

    Catch

.. index:: testing ; Catch

.. _pkg.Catch:

Catch
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.17.6-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.17.6
  :alt: Hunter v0.17.6

-  `Official <https://github.com/philsquared/Catch>`__
-  `Hunterized <https://github.com/hunter-packages/Catch>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(Catch)
    find_package(Catch CONFIG REQUIRED)
    target_link_libraries(... Catch::Catch)

.. spelling::

    Beast

.. index:: networking ; Beast

.. _pkg.Beast:

Beast
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.9.9-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.9.9
  :alt: Hunter v0.9.9

-  `Official <https://github.com/vinniefalco/Beast>`__
-  `Hunterized <https://github.com/hunter-packages/Beast>`__
-  Available since |hunter|

.. code-block:: cmake

    hunter_add_package(Beast)
    find_package(Beast CONFIG REQUIRED)
    target_link_libraries(... Beast::Beast)

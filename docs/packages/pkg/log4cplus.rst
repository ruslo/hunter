.. spelling::

    cplus

.. index:: logging ; log4cplus

.. _pkg.log4cplus:

log4cplus
=========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.9-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.9
  :alt: Hunter v0.12.9

-  `Official <https://github.com/log4cplus/log4cplus>`__
-  `Hunterized <https://github.com/hunter-packages/log4cplus>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/log4cplus/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(log4cplus)
    find_package(log4cplus CONFIG REQUIRED)
    target_link_libraries(... log4cplus::log4cplus)

.. spelling::

    yaml
    cpp

.. index:: yaml ; yaml-cpp

.. _pkg.yaml-cpp:

yaml-cpp
========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.16.34-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.16.34
  :alt: Hunter v0.16.34

-  `Hunterized <https://github.com/jbeder/yaml-cpp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/yaml-cpp/CMakeLists.txt>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-598 <https://github.com/ruslo/hunter/pull/598>`__)
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(yaml-cpp)
    find_package(yaml-cpp CONFIG REQUIRED)
    target_link_libraries(... yaml-cpp::yaml-cpp)

**NOTE**: This is the ``boost`` based last ``c++-98`` version (0.5.3).

.. spelling::

    glog

.. index:: logging ; glog

.. _pkg.glog:

glog
====

-  `Official <https://github.com/google/glog>`__
-  `Hunterized <https://github.com/hunter-packages/glog>`__
-  Maintainer: https://github.com/NeroBurner

.. code-block:: cmake

    hunter_add_package(glog)
    find_package(glog CONFIG REQUIRED)
    target_link_libraries(... glog::glog)

For Hunter <= `v0.17.15 <https://github.com/ruslo/hunter/releases/tag/v0.17.15>`__:

.. code-block:: cmake

    hunter_add_package(glog)
    find_package(glog CONFIG REQUIRED)
    target_link_libraries(... glog)

.. warning::

  Does not work on Android:

  * https://github.com/google/glog/issues/59

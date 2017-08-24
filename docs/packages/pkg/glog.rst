.. spelling::

    glog

.. _pkg.glog:

glog
====

-  `Official <https://github.com/google/glog>`__
-  `Hunterized <https://github.com/hunter-packages/glog>`__
-  Maintainer: `NeroBurner <https://github.com/NeroBurner>`__

.. code:: cmake

    hunter_add_package(glog)
    find_package(glog CONFIG REQUIRED)
    target_link_libraries(... glog::glog)

Until Hunter 0.17.15
--------------------

.. code:: cmake

    hunter_add_package(glog)
    find_package(glog CONFIG REQUIRED)
    target_link_libraries(... glog)

Note that it doesn't work on Android:
https://github.com/google/glog/issues/59

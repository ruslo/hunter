.. spelling::

    libyuv

.. index:: unsorted ; libyuv

.. _pkg.libyuv:

libyuv
======

-  `Official <https://freeswitch.org/stash/scm/sd/libyuv.git>`__
-  `Documentation <https://code.google.com/p/libyuv/w/list>`__
-  `Hunterized <https://github.com/headupinclouds/libyuv/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libyuv/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(libyuv)
    find_package(libyuv CONFIG REQUIRED)
    target_link_libraries(... PUBLIC libyuv::yuv)

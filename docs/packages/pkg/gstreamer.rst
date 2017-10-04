.. spelling::

    gstreamer

.. index:: media ; gstreamer

.. _pkg.gstreamer:

gstreamer
=========

-  `Official <https://gstreamer.freedesktop.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gstreamer/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(gstreamer)
    find_package(gstreamer-1.0 CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::gstreamer-1.0)

.. warning::

  * Only Linux tested

.. spelling::

    gst

.. index:: media ; gst_plugins_base

.. _pkg.gst_plugins_base:

gst_plugins_base
================

-  `Official <https://gstreamer.freedesktop.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gst_plugins_base/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(gst_plugins_base)
    find_package(gstreamer-video-1.0 CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::gstreamer-video-1.0)

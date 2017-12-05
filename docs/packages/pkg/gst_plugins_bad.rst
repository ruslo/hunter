.. spelling::

    gst

.. index:: media ; gst_plugins_bad

.. _pkg.gst_plugins_bad:

gst_plugins_bad
================

-  `Official <https://gstreamer.freedesktop.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gst_plugins_bad/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(gst_plugins_bad)
    find_package(gstreamer-bad-video-1.0 CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::gstreamer-bad-video-1.0)

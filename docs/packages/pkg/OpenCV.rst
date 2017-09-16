.. spelling::

    OpenCV
    GStreamer

.. index:: computer-vision ; OpenCV

.. _pkg.OpenCV:

OpenCV
======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.8.10-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.8.10
  :alt: Hunter v0.8.10

-  `Official <https://github.com/Itseez/opencv>`__
-  `Hunterized <https://github.com/hunter-packages/opencv/tree/hunter-2.4.11>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenCV/CMakeLists.txt>`__
- Available since |hunter|

Usage
-----

.. code-block:: cmake

    hunter_add_package(OpenCV)
    find_package(OpenCV REQUIRED)

    target_link_libraries(... PRIVATE ${OpenCV_LIBS})

Qt back-end
-----------

Qt back-end support for desktop can be enabled by `creating a custom
config <https://github.com/hunter-packages/gate/tree/develop#usage-custom-config>`__
with the line:

.. code-block:: cmake

    hunter_config(OpenCV VERSION ${HUNTER_OpenCV_VERSION} CMAKE_ARGS WITH_QT=YES)

Known issues
------------

-  since hunter
   `v0.18.44 <https://github.com/ruslo/hunter/releases/tag/v0.18.44>`__
   OpenCV can't find system libraries to link against on Linux. If you
   need those dependencies (FFMPEG, GTK, GStreamer, V4L2, etc.) you need
   to fork hunter and revert commit
   `f6f0965 <https://github.com/ruslo/hunter/commit/f6f096561f0e09b4c85e4049a4eb7948ad24d7eb>`__
   in your fork. Try `this
   fork <https://github.com/szatan/hunter/releases>`__ for some already
   patched releases.

.. spelling::

    videotoolbox

.. index:: system_library_finder ; videotoolbox

.. _pkg.videotoolbox:

videotoolbox
============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(videotoolbox REQUIRED)
    target_link_libraries(... videotoolbox::videotoolbox)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework VideoToolbox")

-  https://developer.apple.com/documentation/videotoolbox?language=objc

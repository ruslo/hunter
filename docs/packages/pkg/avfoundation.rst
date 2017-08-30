.. spelling::

    avfoundation

.. index:: system_library_finder ; avfoundation

.. _pkg.avfoundation:

avfoundation
============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(avfoundation REQUIRED)
    target_link_libraries(... avfoundation::avfoundation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AVFoundation")

-  https://developer.apple.com/documentation/avfoundation?language=objc

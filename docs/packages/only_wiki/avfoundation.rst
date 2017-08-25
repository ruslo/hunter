.. spelling::

    avfoundation

.. _pkg.avfoundation:

avfoundation
============

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(avfoundation REQUIRED)
    target_link_libraries(... avfoundation::avfoundation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AVFoundation")

-  https://developer.apple.com/documentation/avfoundation?language=objc

.. spelling::

    avfoundation

.. _pkg.avfoundation:

    avfoundation
    ============
.. code:: cmake

    find_package(avfoundation REQUIRED)
    target_link_libraries(... avfoundation::avfoundation)

Same as

.. code:: cmake

    target_link_libraries(... "-framework AVFoundation")

-  https://developer.apple.com/documentation/avfoundation?language=objc

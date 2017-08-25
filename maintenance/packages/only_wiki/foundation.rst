.. spelling::

    foundation

.. _pkg.foundation:

    foundation
    ==========
.. code-block::cmake

    find_package(foundation REQUIRED)
    target_link_libraries(... foundation::foundation)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework Foundation")

-  https://developer.apple.com/documentation/foundation?language=objc

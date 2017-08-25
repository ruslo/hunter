.. spelling::

    foundation

.. _pkg.foundation:

foundation
==========

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(foundation REQUIRED)
    target_link_libraries(... foundation::foundation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Foundation")

-  https://developer.apple.com/documentation/foundation?language=objc

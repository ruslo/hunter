.. spelling::

    appkit

.. _pkg.appkit:

appkit
======

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(appkit REQUIRED)
    target_link_libraries(... appkit::appkit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AppKit")

-  https://developer.apple.com/documentation/appkit?language=objc

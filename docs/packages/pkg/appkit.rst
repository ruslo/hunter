.. spelling::

    appkit

.. index:: system_library_finder ; appkit

.. _pkg.appkit:

appkit
======

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(appkit REQUIRED)
    target_link_libraries(... appkit::appkit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AppKit")

-  https://developer.apple.com/documentation/appkit?language=objc

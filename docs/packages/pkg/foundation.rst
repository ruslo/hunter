.. spelling::

    foundation

.. index:: system_library_finder ; foundation

.. _pkg.foundation:

foundation
==========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. note::

    Framework ``Cocoa`` is a pseudo framework which in fact is
    just a combination of:

    * ``Foundation``
    * ``AppKit``
    * ``CoreData``

.. code-block:: cmake

    find_package(foundation REQUIRED)
    target_link_libraries(... foundation::foundation)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework Foundation")

-  https://developer.apple.com/documentation/foundation?language=objc

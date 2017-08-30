.. spelling::

    iokit

.. index:: system_library_finder ; iokit

.. _pkg.iokit:

iokit
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(iokit REQUIRED)
    target_link_libraries(... iokit::iokit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework IOKit")

-  https://developer.apple.com/documentation/iokit?language=objc

.. spelling::

    corevideo

.. index:: system_library_finder ; corevideo

.. _pkg.corevideo:

corevideo
=========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(corevideo REQUIRED)
    target_link_libraries(... corevideo::corevideo)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreVideo")

-  https://developer.apple.com/documentation/corevideo?language=objc

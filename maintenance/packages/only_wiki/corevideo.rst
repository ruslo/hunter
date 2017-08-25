.. spelling::

    corevideo

.. _pkg.corevideo:

corevideo
=========

.. code-block:: cmake

    find_package(corevideo REQUIRED)
    target_link_libraries(... corevideo::corevideo)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreVideo")

-  https://developer.apple.com/documentation/corevideo?language=objc

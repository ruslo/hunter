.. spelling::

    corevideo

.. _pkg.corevideo:

    corevideo
    =========
.. code:: cmake

    find_package(corevideo REQUIRED)
    target_link_libraries(... corevideo::corevideo)

Same as

.. code:: cmake

    target_link_libraries(... "-framework CoreVideo")

-  https://developer.apple.com/documentation/corevideo?language=objc

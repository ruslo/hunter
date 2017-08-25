.. spelling::

    glkit

.. _pkg.glkit:

    glkit
    =====
.. code:: cmake

    find_package(glkit REQUIRED)
    target_link_libraries(... glkit::glkit)

Same as

.. code:: cmake

    target_link_libraries(... "-framework GLKit")

-  https://developer.apple.com/documentation/glkit?language=objc

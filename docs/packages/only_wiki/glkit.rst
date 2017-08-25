.. spelling::

    glkit

.. _pkg.glkit:

glkit
=====

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(glkit REQUIRED)
    target_link_libraries(... glkit::glkit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework GLKit")

-  https://developer.apple.com/documentation/glkit?language=objc

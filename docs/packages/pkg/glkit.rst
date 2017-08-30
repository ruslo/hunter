.. spelling::

    glkit

.. index:: system_library_finder ; glkit

.. _pkg.glkit:

glkit
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(glkit REQUIRED)
    target_link_libraries(... glkit::glkit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework GLKit")

-  https://developer.apple.com/documentation/glkit?language=objc

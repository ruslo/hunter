.. spelling::

    imageio

.. index:: system_library_finder ; imageio

.. _pkg.imageio:

imageio
=======

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(imageio REQUIRED)
    target_link_libraries(... imageio::imageio)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework ImageIO")

-  https://developer.apple.com/documentation/imageio?language=objc

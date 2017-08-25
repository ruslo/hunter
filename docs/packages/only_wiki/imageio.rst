.. spelling::

    imageio

.. _pkg.imageio:

imageio
=======

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(imageio REQUIRED)
    target_link_libraries(... imageio::imageio)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework ImageIO")

-  https://developer.apple.com/documentation/imageio?language=objc

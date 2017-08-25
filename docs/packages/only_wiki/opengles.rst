.. spelling::

    opengles

.. _pkg.opengles:

opengles
========

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(opengles REQUIRED)
    target_link_libraries(... opengles::opengles)

Same as

::

    target_link_libraries(... "-framework OpenGLES")

-  https://developer.apple.com/documentation/opengles?language=objc

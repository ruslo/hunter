.. spelling::

    opengles

.. _pkg.opengles:

    opengles
    ========
.. code:: cmake

    find_package(opengles REQUIRED)
    target_link_libraries(... opengles::opengles)

Same as

::

    target_link_libraries(... "-framework OpenGLES")

-  https://developer.apple.com/documentation/opengles?language=objc

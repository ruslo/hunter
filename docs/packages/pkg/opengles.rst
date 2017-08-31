.. spelling::

    opengles

.. index:: system_library_finder ; opengles

.. _pkg.opengles:

opengles
========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(opengles REQUIRED)
    target_link_libraries(... opengles::opengles)

Same as

::

    target_link_libraries(... "-framework OpenGLES")

-  https://developer.apple.com/documentation/opengles?language=objc

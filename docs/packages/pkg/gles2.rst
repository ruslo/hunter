.. spelling::

    gles2
    gles

.. index:: system_library_finder ; gles2

.. _pkg.gles2:

gles2
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(gles2 REQUIRED)
    target_link_libraries(... gles2::gles2)

.. spelling::

    gles3
    gles

.. _pkg.gles3:

.. index:: system_library_finder ; gles3

gles3
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(gles3 REQUIRED)
    target_link_libraries(... gles3::gles3)

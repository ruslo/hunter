.. spelling::

    egl

.. _pkg.egl:

.. index:: system_library_finder ; egl

egl
===

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(egl REQUIRED)
    target_link_libraries(... egl::egl)

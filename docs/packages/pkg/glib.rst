.. spelling::

    glib

.. index:: development ; glib

.. _pkg.glib:

glib
====

-  `Official <https://wiki.gnome.org/Projects/GLib>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/glib/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(glib)
    find_package(glib-2.0 CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::glib-2.0)

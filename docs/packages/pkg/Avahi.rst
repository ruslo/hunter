.. spelling::

    Avahi

.. index:: networking ; Avahi

.. _pkg.Avahi:

Avahi
=====

-  `Official <http://www.avahi.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Avahi/CMakeLists.txt>`__
-  Available since
   `v0.12.10 <https://github.com/ruslo/hunter/releases/tag/v0.12.10>`__
-  Added by `Damien Buhl <https://github.com/daminetreg>`__
   (`pr-237 <https://github.com/ruslo/hunter/pull/237>`__)

.. code-block:: cmake

    hunter_add_package(Avahi)
    find_package(Avahi REQUIRED)
    target_link_libraries(... Avahi::common Avahi::client Avahi::compat_libdns_sd)

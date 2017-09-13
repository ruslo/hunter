.. spelling::

    Libevent

.. index:: networking ; Libevent

.. _pkg.Libevent:

Libevent
========

-  `Official <https://github.com/libevent/libevent>`__
-  `Hunterized <https://github.com/hunter-packages/libevent>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Libevent/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1019 <https://github.com/ruslo/hunter/pull/1019>`__)

.. code-block:: cmake

    hunter_add_package(Libevent)
    find_package(Libevent CONFIG REQUIRED)
    target_link_libraries(... Libevent::event_core
                              Libevent::event_extra)

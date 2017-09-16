.. spelling::

    aglet

.. index:: graphics ; aglet

.. _pkg.aglet:

aglet
=====

-  `Official <https://github.com/elucideye/aglet>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/aglet/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(aglet)
    find_package(aglet CONFIG REQUIRED)
    target_link_libraries(... aglet::aglet)

.. spelling::

    rabbitmq

.. index:: messaging ; rabbitmq-c

.. _pkg.rabbitmq-c:

rabbitmq-c
==========

-  `Official <https://github.com/alanxz/rabbitmq-c>`__
-  `Hunterized <https://github.com/oliverdaniell/rabbitmq-c/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/rabbitmq-c/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(rabbitmq-c)
    find_package(rabbitmq-c REQUIRED)
    target_link_libraries(... rabbitmq-c::rabbitmq-static)

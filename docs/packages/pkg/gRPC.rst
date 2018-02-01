.. spelling::

    gRPC
    grpc

.. index:: networking ; gRPC

.. _pkg.gRPC:

gRPC
====

-  `Official <https://github.com/grpc/grpc>`__
-  `Hunterized <https://github.com/hunter-packages/grpc>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gRPC/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1089 <https://github.com/ruslo/hunter/pull/1089>`__)

.. code-block:: cmake

    hunter_add_package(gRPC)
    find_package(gRPC CONFIG REQUIRED)
    target_link_libraries(... gRPC::grpc)

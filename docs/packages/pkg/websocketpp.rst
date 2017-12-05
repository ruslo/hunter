.. spelling::

    websocketpp

.. index:: networking ; websocketpp

.. _pkg.websocketpp:

websocketpp
===========

-  `Hunterized <https://github.com/hunter-packages/websocketpp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/websocketpp/CMakeLists.txt>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-400 <https://github.com/ruslo/hunter/pull/400>`__)

.. code-block:: cmake

    hunter_add_package(websocketpp)
    find_package(websocketpp CONFIG REQUIRED)
    target_link_libraries(... websocketpp::websocketpp)

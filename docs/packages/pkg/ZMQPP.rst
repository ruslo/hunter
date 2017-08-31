.. spelling::

    ZMQPP

.. index:: messaging ; ZMQPP

.. _pkg.ZMQPP:

ZMQPP
=====

-  `Official <http://zeromq.github.io/zmqpp/>`__
-  `Official GitHub <https://github.com/zeromq/zeromq4-1>`__
-  `Hunterized <https://github.com/hunter-packages/zeromq4-1>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ZMQPP/CMakeLists.txt>`__
-  Available since
   `v0.14.7 <https://github.com/ruslo/hunter/releases/tag/v0.14.7>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-343 <https://github.com/ruslo/hunter/pull/343>`__)

.. code-block:: cmake

    # This will failed if C++11 is not enabled or not supported.
    hunter_add_package(ZMQPP)

    find_package(ZMQPP CONFIG REQUIRED)

    target_link_libraries(... ZMQPP::zmqpp)

Note
----

This library requires C++11.

Bugs
----

-  Currently can be used only on Linux

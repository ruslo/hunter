.. spelling::

    ZMQPP

.. index:: messaging ; ZMQPP

.. _pkg.ZMQPP:

ZMQPP
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.14.7-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.14.7
  :alt: Hunter v0.14.7

-  `Official <http://zeromq.github.io/zmqpp/>`__
-  `Official GitHub <https://github.com/zeromq/zeromq4-1>`__
-  `Hunterized <https://github.com/hunter-packages/zeromq4-1>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ZMQPP/CMakeLists.txt>`__
- Available since |hunter|
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

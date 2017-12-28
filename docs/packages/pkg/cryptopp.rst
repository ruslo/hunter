.. spelling::

    cryptopp

.. index:: crypto ; cryptopp

.. _pkg.cryptopp:

cryptopp
========

-  `Official <https://www.cryptopp.com/>`__
-  `Source code  <https://github.com/weidai11/cryptopp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cryptopp/CMakeLists.txt>`__
-  Available since `__FIXME__ vX.Y.Z <https://github.com/ruslo/hunter/releases/tag/vX.Y.Z>`__
-  Added by `Paweł Bylica <https://github.com/chfast>`__ (`pr-1041 <https://github.com/ruslo/hunter/pull/1041>`__)

.. code-block:: cmake

    hunter_add_package(cryptopp)
    find_package(cryptopp CONFIG REQUIRED)
    target_link_libraries(foo cryptopp-static)

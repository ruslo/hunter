.. spelling::

    BoringSSL

.. index:: crypto ; BoringSSL

.. _pkg.BoringSSL:

BoringSSL
=========

.. warning::

  * This library implements :ref:`pkg.OpenSSL` API. Usage of this package
    can lead to conflicts. Please read
    `this issue <https://github.com/ruslo/hunter/issues/1191>`__
    and make sure you're understand what you're doing.

-  `Official <https://github.com/google/boringssl>`__
-  `Hunterized <https://github.com/hunter-packages/boringssl>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/BoringSSL/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1186 <https://github.com/ruslo/hunter/pull/1186>`__)

.. code-block:: cmake

    hunter_add_package(BoringSSL)
    find_package(BoringSSL CONFIG REQUIRED)
    target_link_libraries(boo BoringSSL::ssl BoringSSL::crypto)

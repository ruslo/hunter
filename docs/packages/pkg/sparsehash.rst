.. spelling::

    sparsehash

.. index:: containers ; sparsehash

.. _pkg.sparsehash:

sparsehash
==========

-  `Official <https://code.google.com/p/sparsehash/>`__
-  `Hunter <https://github.com/aadityakalsi/sparsehash>`__

Example:

.. code-block:: cmake

    hunter_add_package(sparsehash)
    set(SPARSEHASH_INCLUDE_DIRS ${SPARSEHASH_ROOT}/include)

    target_include_directories(... ${SPARSEHASH_INCLUDE_DIRS})

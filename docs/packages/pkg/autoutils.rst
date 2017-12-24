.. spelling::

    autoutils

.. index:: cmake_modules ; autoutils

.. _pkg.autoutils:

autoutils
=========

-  `Project <https://github.com/isaachier/autoutils>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/autoutils/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(autoutils)
    list(APPEND CMAKE_MODULE_PATH "${AUTOUTILS_ROOT}/cmake")

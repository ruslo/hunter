.. spelling::

    gauze

.. index:: testing ; gauze

.. _pkg.gauze:

gauze
=====

-  `Official <https://github.com/hunter-packages/gauze>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gauze/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(gauze)
    find_package(gauze CONFIG REQUIRED)
    gauze_add_test(NAME foo COMMAND foo)

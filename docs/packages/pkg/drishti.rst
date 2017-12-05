.. spelling::

    drishti

.. index:: computer-vision ; drishti

.. _pkg.drishti:

drishti
=======

- `Official <https://github.com/elucideye/drishti>`__
- `Example <https://github.com/ruslo/hunter/blob/master/examples/drishti/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(drishti)
    find_package(drishti CONFIG REQUIRED)
    target_link_libraries(... drishti::drishti)

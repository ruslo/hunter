.. spelling::

    jo
    jpeg

.. index:: unsorted ; jo_jpeg

.. _pkg.jo_jpeg:

jo_jpeg
=======

- http://www.jonolick.com/code.html
- `Hunterized <https://github.com/hunter-packages/jo_jpeg>`__
- `Example <https://github.com/ruslo/hunter/blob/master/examples/jo_jpeg/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(jo_jpeg)
    find_package(jo_jpeg CONFIG REQUIRED)
    target_link_libraries(foo jo_jpeg::jo_jpeg)

.. spelling::

    osmesa

.. _pkg.osmesa:

    osmesa
    ======
.. code-block::cmake

    find_package(osmesa REQUIRED)
    target_link_libraries(... osmesa::osmesa)

Ubuntu:

::

    > sudo apt-get install -y libosmesa6-dev

Travis:

.. code-block::yml

    addons:
      apt:
        packages:
          - libosmesa6-dev

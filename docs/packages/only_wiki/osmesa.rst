.. spelling::

    osmesa

.. _pkg.osmesa:

osmesa
======

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(osmesa REQUIRED)
    target_link_libraries(... osmesa::osmesa)

Ubuntu:

::

    > sudo apt-get install -y libosmesa6-dev

Travis:

.. code-block:: yaml

    addons:
      apt:
        packages:
          - libosmesa6-dev

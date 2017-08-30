.. spelling::

    osmesa

.. index:: system_library_finder ; osmesa

.. _pkg.osmesa:

osmesa
======

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

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

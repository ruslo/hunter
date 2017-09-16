.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Config-ID
---------

.. spelling::

  eae

.. _config-id:

Third level of customization. Set version of package to build and
its build options.

``Config-ID`` is the first 7 digits of ``SHA1`` of the file with
``hunter_config`` commands (internal unified representation).  This level can
be customized with `HunterGate options`_: ``GLOBAL``, ``LOCAL`` and
``FILEPATH``. Packages from ``Hunter-ID 1eae623`` can be built using different
versions and different CMake arguments:

+-------------------+----------------------+
| Hunter-ID 1eae623 | Toolchain-ID d46ea0b |
+-------------------+----------------------+

+-------------+--------------------------------------------------------------------------+
| Config-ID   |                                                                          |
+=============+===================+======================================================+
| ``0fa873a`` | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/d46ea0b/0fa873a/...`` |
|             +-------------------+---------+-----------+--------------------------------+
|             | Packages          | Name    | Version   | Options                        |
|             |                   +---------+-----------+--------------------------------+
|             |                   | ``Foo`` | ``1.0.0`` |                                |
|             |                   +---------+-----------+--------------------------------+
|             |                   | ``Boo`` | ``2.0.0`` | ``BOO_WITH_SOMETHING=YES``     |
+-------------+-------------------+---------+-----------+--------------------------------+
| ``e9da39c`` | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/d46ea0b/e9da39c/...`` |
|             +-------------------+---------+-----------+--------------------------------+
|             | Packages          | Name    | Version   | Options                        |
|             |                   +---------+-----------+--------------------------------+
|             |                   | ``Foo`` | ``2.1.0`` | ``FOO_SUPER_MODE=YES``         |
|             |                   +---------+-----------+--------------------------------+
|             |                   | ``Boo`` | ``3.0.0`` | ``BUILD_SHARED_LIBS=ON``       |
+-------------+-------------------+---------+-----------+--------------------------------+


Message in logs:

.. code-block:: none

  -- [hunter] [ Hunter-ID: 1eae623 | Toolchain-ID: d46ea0b | Config-ID: 0fa873a ]
  -- [hunter] [ Hunter-ID: 1eae623 | Toolchain-ID: d46ea0b | Config-ID: e9da39c ]

.. seealso::

  * `Example <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`_

.. _HunterGate options: https://github.com/hunter-packages/gate#usage-custom-config

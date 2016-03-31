Config-ID
---------

.. _config-id:

Second level of customization. Set version of package to build and build
options.

``Config-ID`` is the first 7 digits of ``SHA1`` of the file with
``hunter_config`` commands (internal unified representation).  This level can
be customized with `HunterGate options`_: ``GLOBAL``, ``LOCAL`` and
``FILEPATH``. Packages from ``Hunter-ID 1eae623`` can be built using different
versions and different CMake arguments:

+-------------------+
| Hunter-ID 1eae623 |
+-------------------+

+-------------+----------------------------------------------------------------------+
| Config-ID   |                                                                      |
+=============+===================+==================================================+
| ``0fa873a`` | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/0fa873a/...``     |
|             +-------------------+---------+-----------+----------------------------+
|             | Packages          | Name    | Version   | Options                    |
|             |                   +---------+-----------+----------------------------+
|             |                   | ``Foo`` | ``1.0.0`` |                            |
|             |                   +---------+-----------+----------------------------+
|             |                   | ``Boo`` | ``2.0.0`` | ``BOO_WITH_SOMETHING=YES`` |
+-------------+-------------------+---------+-----------+----------------------------+
| ``e9da39c`` | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/e9da39c/...``     |
|             +-------------------+---------+-----------+----------------------------+
|             | Packages          | Name    | Version   | Options                    |
|             |                   +---------+-----------+----------------------------+
|             |                   | ``Foo`` | ``2.1.0`` | ``FOO_SUPER_MODE=YES``     |
|             |                   +---------+-----------+----------------------------+
|             |                   | ``Boo`` | ``3.0.0`` | ``BUILD_SHARED_LIBS=ON``   |
+-------------+-------------------+---------+-----------+----------------------------+


Message in logs:

::

  -- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: ... ]
  -- [hunter] [ Hunter-ID: 1eae623 | Config-ID: e9da39c | Toolchain-ID: ... ]

.. seealso::

  * `Example <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`_

.. _HunterGate options: https://github.com/hunter-packages/gate#usage-custom-config

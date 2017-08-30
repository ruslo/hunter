.. spelling::

    Lua

.. index:: scripting ; Lua

.. _pkg.Lua:

Lua
===

-  `Official <http://www.lua.org/ftp/>`__
-  `Hunterized <https://github.com/hunter-packages/lua>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/Lua/CMakeLists.txt>`__
-  Available since
   `v0.12.35 <https://github.com/ruslo/hunter/releases/tag/v0.12.35>`__
-  Added by `Denis Kerzhemanov <https://github.com/Dinno>`__
   (`pr-283 <https://github.com/ruslo/hunter/pull/283>`__)

.. code-block:: cmake

    hunter_add_package(Lua)
    execute_process(COMMAND "${LUA_ROOT}/bin/lua" ...)

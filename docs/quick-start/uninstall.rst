Uninstall
---------

All directories inside ``${HUNTER_ROOT}/_Base`` are reconstructible. You can
remove all temps (downloads, unpacked directories, installed directories etc.)
by command:

.. code-block:: shell

  rm -rf "${HUNTER_ROOT}/_Base"

Or remove particular ``Hunter-ID`` by command:

.. code-block:: shell

  rm -rf "${HUNTER_ROOT}/_Base/62422b8" # remove installed libraries
  rm -rf "${HUNTER_ROOT}/_Base/Download/Hunter/0.8.3/62422b8" # remove Hunter itself

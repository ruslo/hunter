Using Artifactory as binary cache server
----------------------------------------

* https://jfrog.com/artifactory/

Uploading to Artifactory
========================

* Use :ref:`HUNTER_RUN_UPLOAD=YES <hunter_run_upload>` option to **start
  upload** procedure

.. warning::

  **All entries** from ``Cache`` directory will be uploaded, not only cache for
  the current build. Take this information into account while doing upload!

Downloading from Artifactory
============================

Set :ref:`HUNTER_CACHE_SERVERS <hunter_cache_servers>`
variable before ``HunterGate`` to configure ``Hunter`` to use ``Artifactory`` server:

.. code-block:: cmake

  set(
      HUNTER_CACHE_SERVERS
      "https://my.server.com/artifactory/hunter/cache"
      CACHE
      STRING
      "Hunter cache servers"
  )

  HunterGate(URL "..." SHA1 "...")

If needed Artifactory key can be set by ``HTTPHEADER`` in
:doc:`Hunter passwords file </reference/terminology/hunter-passwords-file>`:

.. code-block:: cmake

  hunter_cache_server_password(
      SERVER "https://my.server.com/artifactory/hunter/cache"
      HTTPHEADER "X-JFrog-Art-Api: ${artifactory_key}"
  )

Note that Artifactory treats URLs like
``https://my.server.com/.../file.txt.sha1`` as a special URL to get SHA1 hash
of file ``https://my.server.com/.../file.txt``. Use ``SUB_SHA1_SUFFIX``
to download all internal Hunter cache meta files of form ``abc.sha1``
by using ``abc_sha1`` URL:

.. code-block:: cmake

  hunter_cache_server_password(
      SERVER "https://my.server.com/artifactory/hunter/cache"
      HTTPHEADER "X-JFrog-Art-Api: ${artifactory_key}"
      SUB_SHA1_SUFFIX
  )

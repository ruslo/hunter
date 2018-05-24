.. Copyright (c) 2016-2017, Ruslan Baratov
.. All rights reserved.

Hunter user
-----------

.. toctree::
   :maxdepth: 1

   /user-guides/hunter-user/git-submodule
   /user-guides/hunter-user/git-self

Uploading binaries
==================

It's possible to upload local ``Cache`` directory with binaries to server
for future reuse.

Variables and modules related to uploading:

* List of servers that will be used for **downloading binaries** can be set in
  :ref:`HUNTER_CACHE_SERVERS <hunter_cache_servers>` variable

* If you want to check that there is no third party **builds triggered** by
  CMake and all packages downloaded from server you can use
  :ref:`HUNTER_DISABLE_BUILDS <hunter_disable_builds>` variable

* Variable :ref:`HUNTER_USE_CACHE_SERVERS <hunter_use_cache_servers>` can be
  used to specify **downloading policy**

* **Uploading parameters** can be set using
  :ref:`hunter_upload_password <hunter_upload_password>` module in
  :doc:`Hunter passwords file </reference/terminology/hunter-passwords-file>`

* Use :ref:`HUNTER_RUN_UPLOAD=YES <hunter_run_upload>` option to **start
  upload** procedure

.. warning::

  **All entries** from ``Cache`` directory will be uploaded, not only cache for
  the current build. Take this information into account while doing upload!

.. toctree::
   :maxdepth: 1

   /user-guides/hunter-user/github-cache-server
   /user-guides/hunter-user/nexus-cache-server
   /user-guides/hunter-user/artifactory-cache-server

.. seealso::

  * :doc:`F.A.Q.: Why binaries from server not used? </faq/why-binaries-from-server-not-used>`

TODO
====

* add more find_packages
* add toolchain-id flags
* add hunter_add_package
* custom configs
* add package
* -> CGold

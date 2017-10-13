Using Nexus Repository manager as binary cache server
-----------------------------------------------------

Hunter allows to upload binary cache to any server. If you want to use `GitHub <https://github.com>`__
as a cache server, then you can execute
`python script <https://github.com/ruslo/hunter/blob/master/maintenance/upload-cache-to-github.py>`__
which is uploading cache binaries to `GitHub <https://github.com>`__
directly. As an alternative you can also use ``Nexus Repository Manager``.

.. seealso::

  :doc:`/faq/why-binaries-from-server-not-used`

Nexus installation
==================

In order to install and configure Nexus Repository Manager, please follow
official `documentation <https://books.sonatype.com/nexus-book/reference/install.html>`__.
There is also possibility do download ``docker images`` where
``Nexus Repository Manager`` is already installed:

* `Nexus Repository Manager 2 <https://github.com/sonatype/docker-nexus>`__
* `Nexus Repository Manager 3 <https://github.com/sonatype/docker-nexus3>`__

Nexus adding, configuring and managing repositories
===================================================

To create new or manage existing repository follow this links:

* `Adding a new repository <https://books.sonatype.com/nexus-book/reference/config-sect-new-repo.html>`__
* `Managing repositories <https://books.sonatype.com/nexus-book/reference/confignx-sect-manage-repo.html>`__
* `Configuring repositories <https://books.sonatype.com/nexus-book/reference/confignx-sect-manage-repo.html#_configuring_repositories>`__

Uploading cache binaries to Nexus
=================================

The simplest way to upload local cache binaries to Nexus server is by using
``cURL``:

.. code-block:: bash

   $ cd hunter/_Base/Cache/meta
   $ CACHE_REPOSITORY_URL="http://my.nexus.server.com/content/repositories/hunter/cache"
   $ find ./ -type f -exec curl -u nexuser:nexpwd --upload-file "{}" "$CACHE_REPOSITORY_URL/meta/{}"
   $ cd ../raw
   $ find ./ -type f -exec curl -u nexuser:nexpwd --upload-file "{}" "$CACHE_REPOSITORY_URL/raw/{}"

Configuring Hunter to use Nexus
===============================

Set :ref:`HUNTER_CACHE_SERVERS <hunter_cache_servers>`
variable before ``HunterGate`` to configure ``Hunter`` to use ``Nexus`` server:

.. code-block:: cmake

  set(
      HUNTER_CACHE_SERVERS
      "http://my.nexus.server.com/content/repositories/hunter/cache"
      CACHE
      STRING
      "Hunter cache servers"
  )

  HunterGate(URL "..." SHA1 "...")

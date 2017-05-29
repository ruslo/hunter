Using Nexus Repository manager as binary cache server
-----------------------------------------------------

Hunter allows to upload binary cache to any server. If you want to use `github <https://github.com>`__
as a cache server, then you can execute `python script <https://github.com/ruslo/hunter/blob/master/maintenance/upload-cache-to-github.py>`__
which is uploading cache binaries to `github <https://github.com>`__
directly. As an alternative you can also use ``Nexus Repository Manager``.

Nexus installation
==================

In order to install and configure Nexus Repository Manager, please follow official Sonartype `documentation. <https://books.sonatype.com/nexus-book/reference/install.html>`__
There is also possibility do download ``docker images`` with preinstalled Nexus Repository Manager:

* Nexus Repository Manager 2: https://github.com/sonatype/docker-nexus

* Nexus Repository Manager 3: https://github.com/sonatype/docker-nexus3

Nexus adding, configuring and managing repositories
===================================================

To create new or manage existing repository follow this links:

* Adding a new repository: https://books.sonatype.com/nexus-book/reference/config-sect-new-repo.html

* Managing repositories: https://books.sonatype.com/nexus-book/reference/confignx-sect-manage-repo.html

* Configuring repositories: https://books.sonatype.com/nexus-book/reference/confignx-sect-manage-repo.html#_configuring_repositories

Uploading cache binaries to Nexus
=================================

The simplest way to upload local cache binaries to Nexus server is by using ``curl``:

.. code-block:: bash

   $ cd hunter/_Base/Cache/meta
   $ CACHE_REPOSITORY_URL="http://my.nexus.server.com/content/repositories/hunter/cache"
   $ find ./ -type f -exec curl -u nexuser:nexpwd --upload-file "{}" "$CACHE_REPOSITORY_URL/meta/{}"
   $ cd ../raw
   $ find ./ -type f -exec curl -u nexuser:nexpwd --upload-file "{}" "$CACHE_REPOSITORY_URL/raw/{}"

Configuring Hunter to use Nexus
===============================

To configure ``Hunter`` to use ``Nexus`` server, you must perform the following step:

.. code-block:: cmake

   list(APPEND HUNTER_CACHE_SERVERS "http://my.nexus.server.com/content/repositories/hunter/cache")

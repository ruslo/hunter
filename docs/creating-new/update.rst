.. Copyright (c) 2017, Ruslan Baratov
.. All rights reserved.

.. spelling::

  diff

Update package
--------------

Create branch for working on package update:

.. code-block:: none

  [hunter]> git checkout master
  [hunter]> git checkout -b pr.hunter_box_1

Calculate SHA1 of release:

.. code-block:: none

  > wget https://github.com/hunterbox/hunter_box_1/archive/v1.0.1.tar.gz
  > openssl sha1 v1.0.1.tar.gz
  SHA1(v1.0.1.tar.gz)= 10d046eec6c8b0aabd28bd3d1b99faf6beeb226b

Add URL and SHA1 to corresponding ``hunter.cmake``:

.. literalinclude:: hunter-NEW.cmake
  :diff: hunter.cmake

.. hint::

  Put new ``hunter_add_version`` at the bottom of file, diff will look
  prettier in this case.

Update default version in ``cmake/configs/default.cmake``:

.. literalinclude:: default-NEW.cmake
  :diff: default.cmake

Commit changes:

.. code-block:: none

  [hunter]> git add cmake/projects/hunter_box_1/hunter.cmake
  [hunter]> git add cmake/configs/default.cmake
  [hunter]> git commit -m "Update 'hunter_box_1' to v1.0.1"

Testing
=======

.. note::

  Check :ref:`Create package: CI testing <ci testing>` page for registering
  services and branches/remotes description.

Fetch latest CI configs, you may need to run ``git pull`` if you have
``pkg.hunter_box_1`` locally:

.. code-block:: none

  [hunter]> git fetch ci
  [hunter]> git checkout pkg.hunter_box_1
  [hunter]> git pull

Create temporary branch ``test.hunter_box_1`` for testing basing on
``pkg.hunter_box_1``:

.. code-block:: none

  [hunter]> git checkout -b test.hunter_box_1

Merge it with ``hunter_box_1`` package updates:

.. code-block:: none

  [hunter]> git merge pr.hunter_box_1

Push changes to your Hunter fork remote to start tests:

.. code-block:: none

  [hunter]> git push -u origin test.hunter_box_1

.. image:: /creating-new/images/pr-update-version.png
  :align: center
  :alt: Branches

Add toolchains
==============

If new version of package fix some build:

* Add new version to ``master``
* Tests against **old** set of toolchains
* New version merged to master
* Send pull request to ``pkg.hunter_box_1`` to enable **new** toolchains

Remove toolchains
=================

If new version broke some toolchain:

* Disable toolchains in ``pkg.hunter_box_1``
* Add new version to ``master``
* Tests against **new** set of toolchains without broken

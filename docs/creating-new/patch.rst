.. Copyright (c) 2017, Ruslan Baratov
.. All rights reserved.

Patch sources
-------------

You may need to patch sources to apply CMake best practices or hunterize
package with dependencies.

In practice patching requires to have a fork of a project.  In general it does
not matter where the fork is located. But it matters that there is a central
place for the patched packages:

* https://github.com/hunter-packages

If you want to create new fork let me know about it in a corresponding issue
with `"new package" label`_, I will create a new team and add you so you can
push changes.

Please follow next rules:

* Instead of pushing changes directly to branch open pull request so other
  developers can review your changes.

* Start working on patches from latest stable upstream tag. I.e. if latest
  release is ``v1.3.15`` then create branch ``hunter-v1.3.15`` and add
  patches there.

* Keep other branches in a **clean state** so we can always do
  ``git merge --ff-only`` from upstream.

* Please do push commits **only related to hunterization**. Do not push general
  fixes and improvements, do push them **upstream** instead. Perfect
  hunterization should contain only:

  * Adding ``HunterGate`` module (`example <https://github.com/hunter-packages/opencv/commit/a5d663884a186c8dfdabb9dcae92defd32d28329?diff=unified>`__)
  * Including it with some URL/SHA1 (`example <https://github.com/hunter-packages/opencv/commit/f1d4605e9e50cc0e45cb74c26ce24e094ee16bc5?diff=unified>`__)
  * Adding ``hunter_add_package`` commands (`example <https://github.com/hunter-packages/opencv/commit/b65ec7f719d1da17c01b154a847d2b89cfbaacb8?diff=unified>`__)

Note that I'm not willing and can't maintain all packages in practice. Therefore
I do add all developers to the team **if they ask to**. If you want to be
a **maintainer**, keep eye on changes, pull requests, be responsible for review
and releases - let me know.

Also note that Hunter is designed to have **zero maintenance** for such tasks,
since you can add ``HUNTER_ENABLED=OFF`` option at the top of the project
to skip all package management stuff (see :doc:`/overview/compatibility`).  It
means you can push branch ``hunter`` to upstream without affecting
functionality of the project. As a summary it may sounds strange, but the final
goal of this organization is to have no forks of packages at all.

.. _"new package" label: https://github.com/ruslo/hunter/issues?q=is%3Aopen+is%3Aissue+label%3A%22new+package%22

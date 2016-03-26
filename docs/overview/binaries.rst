Binaries from server
--------------------

Hunter has internal mechanism of saving binaries of installed packages along
with meta information about toolchain, build options and dependencies.
This allow to not trigger same build on creation of new root directory.
For example when user change version of ``OpenSSL`` from ``1.0.1`` to ``1.0.2``
it does affect ``Config-ID`` so new root will be created. But it will not affect
how ``GTest`` builds (if it's not a dependency) so ``GTest`` archive can be
unpacked from cache. Such cache can be used locally or uploaded to server.

.. seealso::

  * `Uploading binaries to server <https://github.com/ruslo/hunter/wiki/Uploading-binaries-to-server>`_
  * `Status of uploading packages from Travis/AppVeyor <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=upload.>`_

.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

How to fix hash mismatch error?
-------------------------------

da39a3ee5e6b4b0d3255bfef95601890afd80709
========================================

If you see error like this:

.. code-block:: none

  does not match expected value
  expected: '...'
  actual: 'da39a3ee5e6b4b0d3255bfef95601890afd80709'

It means you're experiencing some
:doc:`download error </faq/how-to-fix-download-error>`.

``da39a3ee5e6b4b0d3255bfef95601890afd80709`` is a hash of an empty file:

.. code-block:: none

  > echo -n "" | openssl sha1
  (stdin)= da39a3ee5e6b4b0d3255bfef95601890afd80709

Other
=====

GitHub creates release archives on-the-fly and they are not guaranteed to be
stable. This fact was discovered after few years of relying on the assumption
of stability of such archives :)

In most cases the problem can be solved just by updating Hunter to latest
version and using latest packages version in case you have saved non-default
versions in ``LOCAL``.

There will be no automatic update of hashes introduced since it affects binary
cache, hence all the packages should be re-uploaded. And upload procedure is not
automatic yet. Instead update will be introduced on demand.

The best solution is to find archive with old SHA1 in local
:ref:`Download directory <layout deployed download>`. Then upload it as asset
attached to the same release tag and add new URL to Hunter. In this case it
will fix new builds and keep old cache binaries, feel free to open new issue
and provide the link to old archive.

.. seealso::

  * https://github.com/ruslo/hunter/issues/1032

.. note::

  It's not a Hunter specific issue. All tools that rely on the stability of
  GitHub archives was affected, as an example:

  * https://github.com/Homebrew/homebrew-core/issues/18044
  * https://github.com/libgit2/libgit2/issues/4343

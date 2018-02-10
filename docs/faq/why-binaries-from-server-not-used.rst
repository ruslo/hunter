.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Why binaries from server not used?
==================================

.. seealso::

  * :ref:`Using GitHub cache server <uploading to server>`

If settings and environment of your local project does not match environment
of Travis/AppVeyor services (this is where binaries usually uploaded from)
you will see ``Cache miss`` message and package will be build locally:

.. code-block:: none
  :emphasize-lines: 5

  -- [hunter *** DEBUG *** ...] Downloading file (try #1 of 10):
  -- [hunter *** DEBUG *** ...]   https://raw.githubusercontent.com/ingenue/hunter-cache/master/aa85dd8/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.DONE
  -- [hunter *** DEBUG *** ...]   -> /.../_Base/Cache/meta/aa85dd8/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.DONE
  -- [hunter *** DEBUG *** ...] File not found
  -- [hunter *** DEBUG *** ...] Cache miss (no basic dependencies info found: /.../_Base/Cache/meta/aa85dd8/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.DONE)

Reproduce environment
---------------------

Next information will help you to set your environment.

* Xcode 6.1 used by default on Travis CI:

 * `The OS X Build Environment <https://docs.travis-ci.com/user/osx-ci-environment/#Xcode>`__
 * `iOS 8.1 SDK is default for Xcode 6.1 <https://github.com/ruslo/polly/wiki/Toolchain-list#ios>`__
 * `Xcode 6.1 direct download link <http://adcdownload.apple.com/Developer_Tools/xcode_6.1/56841_xcode_6.1.dmg>`__

* Xcode 7.3.1 used for ``osx_image: xcode7.3`` on Travis CI:

 * `Xcode 7.3.1 image <https://docs.travis-ci.com/user/osx-ci-environment/#Xcode-7.3>`__
 * `iOS 9.3 SDK is default for Xcode 7.3 <https://github.com/ruslo/polly/wiki/Toolchain-list#ios>`__
 * `Xcode 7.3.1 direct download link <http://adcdownload.apple.com/Developer_Tools/Xcode_7.3.1/Xcode_7.3.1.dmg>`__

* Visual Studio versions on AppVeyor:

 * https://www.appveyor.com/docs/installed-software/#visual-studio

* Docker can be used for reproducing Travis CI Linux environment:

 * Install Docker on Ubuntu: https://docs.docker.com/engine/installation/linux/ubuntulinux/
 * Pull image and run container by (see `details <https://github.com/hunter-packages/travis-linux-docker>`__):

.. code-block:: shell

  > docker pull quay.io/ruslo/hunter-travis-trusty # pull/update image
  > docker run -it quay.io/ruslo/hunter-travis-trusty bash
  travis@...:~$ (cd polly && git pull) # fetch last changes
  travis@...:~$ (cd hunter && git pull) # - // -
  travis@...:~$  cd hunter && TOOLCHAIN=gcc PROJECT_DIR=examples/GTest ./jenkins.py --verbose --clear-except

Starting GUI:

.. code-block:: shell

  > xhost +
  > docker run -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix quay.io/ruslo/hunter-travis-trusty bash
  travis@...:~$ firefox

Information from logs
---------------------

When ``HUNTER_STATUS_DEBUG`` is ``ON`` you can find information about servers
and cache state.

List of servers used (`HUNTER_CACHE_SERVERS <https://github.com/ruslo/hunter/wiki/usr.variables#hunter_cache_server>`__):

.. code-block:: none

  -- [hunter *** DEBUG *** ...] List of cache servers:
  -- [hunter *** DEBUG *** ...]   * https://github.com/ingenue/hunter-cache

Meta information not found on server (cache miss):

.. code-block:: none
  :emphasize-lines: 5

  -- [hunter *** DEBUG *** ...] Try to download file (try #0 of 3):
  -- [hunter *** DEBUG *** ...]   https://raw.githubusercontent.com/ingenue/hunter-cache/master/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.info
  -- [hunter *** DEBUG *** ...]   -> /.../_Base/Cache/meta/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.info
  -- [hunter *** DEBUG *** ...] File not found
  -- [hunter *** DEBUG *** ...] Cache miss (no basic dependencies info found: /.../_Base/Cache/meta/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.DONE)

Meta information found on server (cache hit):

.. code-block:: none
  :emphasize-lines: 4

  -- [hunter *** DEBUG *** ...] Try to download file (try #0 of 3):
  -- [hunter *** DEBUG *** ...]   https://raw.githubusercontent.com/ingenue/hunter-cache/master/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/da39a3e/cache.sha1
  -- [hunter *** DEBUG *** ...]   -> /.../_Base/Cache/meta/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/da39a3e/cache.sha1
  -- [hunter] Cache HIT: GTest
  -- [hunter] Cache info: /.../_Base/Cache/meta/2695528/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/da39a3e/cache.sha1

Downloading archive with binaries:

.. code-block:: none
  :emphasize-lines: 2, 5

  -- [hunter *** DEBUG *** ...] Try to download file (try #0 of 3):
  -- [hunter *** DEBUG *** ...]   https://github.com/ingenue/hunter-cache/releases/download/cache/da62fc35901e07d30db7a1c19b7358855978e11f.tar.bz2
  -- [hunter *** DEBUG *** ...]   -> /.../_Base/Cache/raw/da62fc35901e07d30db7a1c19b7358855978e11f.tar.bz2
  -- [hunter *** DEBUG *** ...] Unpacking:
  -- [hunter *** DEBUG *** ...]   /.../_Base/Cache/raw/da62fc35901e07d30db7a1c19b7358855978e11f.tar.bz2
  -- [hunter *** DEBUG *** ...]   -> /.../_Base/3f0dbc9/6104b67/2695528/Install

.. seealso::

  * `Example of log <https://travis-ci.org/forexample/hunter-simple/jobs/116296645>`__

Debugging mismatches
--------------------

If environment looks the same and you're expecting everything to work fine but
still see ``Cache miss`` message you can download meta directory and do
investigate problem:

.. code-block:: shell

  > git clone https://github.com/ingenue/hunter-cache

Information about missing cache entry:

.. code-block:: none

  -- [hunter *** DEBUG *** ...] Downloading file (try #1 of 10):
  -- [hunter *** DEBUG *** ...]   https://raw.githubusercontent.com/ingenue/hunter-cache/master/aa85dd8/GTest/1.8.0-hunter-p2/93148cb/da39a3e/a49b0e5/356a192/basic-deps.DONE

First ``aa85dd8`` id is about toolchain. You can find the path to toolchain info
in logs:

.. code-block:: none

  -- [hunter *** DEBUG *** ...] HUNTER_TOOLCHAIN_ID_PATH: /.../_Base/86b1bc9/aa85dd8

.. code-block:: shell

  > openssl sha1 /.../_Base/86b1bc9/aa85dd8/toolchain.info
  SHA1(toolchain.info)= aa85dd86f2feefe76397d7b624ccb6c09d971fe5

You can see that there is no ``aa85dd8`` entry in cache:

.. code-block:: shell

  > ls hunter-cache/aa85dd8
  ls: cannot access 'hunter-cache/aa85dd8': No such file or directory

However in `Travis build log <https://travis-ci.org/ingenue/hunter/jobs/154160109>`__
``toolchain-id`` is ``8928885``:

.. code-block:: shell

  > ls hunter-cache/8928885/toolchain.info
  hunter-cache/8928885/toolchain.info

Compare both files to figure out what's wrong:

.. code-block:: shell

  > diff hunter-cache/8928885/toolchain.info /.../_Base/86b1bc9/aa85dd8/toolchain.info
  ...
  < #define __GNUC_MINOR__ 8
  < #define __GNUC_PATCHLEVEL__ 1
  ---
  > #define __GNUC_MINOR__ 4
  > #define __GNUC_PATCHLEVEL__ 0
  111,112c115,116
  < #define __GNUC__ 4
  < #define __GNUG__ 4
  ---
  > #define __GNUC__ 5
  > #define __GNUG__ 5

It means that local GCC version is ``5.4.0`` and server version is ``4.8.1``.

.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Why binaries from server not used?
==================================

If settings and environment of your local project doesn't match environment
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

.. _uploading to server:

Uploading to server
-------------------

It is possible to upload Hunter binary cache to the server.
For now only GitHub hosting supported. All big raw ``*.tar.bz2`` archives
uploaded as assets to release with name ``cache`` (directory layout doesn't
matter) and all small text files with meta information uploaded directly to
branch ``master`` (directory layout matters) (see
`hunter-cache <https://github.com/ingenue/hunter-cache>`__ as example).

.. note::

  If you have shared folder in your network there is no need to use
  any scripts, you can just set ``HUNTER_ROOT`` variable to location of this
  directory.

This job can be
done using Python script ``maintenance/upload-cache-to-github.py`` (which may be
called by ``jenkins.py --upload``). Note that downloading from server done by
``file(DOWNLOAD ...)`` CMake commands, so client is still CMake-only based.

Extra servers can be added by modifying variable
`HUNTER_CACHE_SERVERS <https://github.com/ruslo/hunter/wiki/usr.variables#hunter_cache_servers>`__
before ``HunterGate`` command:

.. code-block:: cmake

  list(APPEND HUNTER_CACHE_SERVERS "https://github.com/ingenue/hunter-cache")
  HunterGate(URL ... SHA1 ...)

If you want to check that there is no 3rd party builds triggered by CMake and
all packages downloaded from server you can use
`HUNTER_DISABLE_BUILDS <https://github.com/ruslo/hunter/wiki/usr.variables#hunter_disable_builds>`__
variable. Also variable
`HUNTER_USE_CACHE_SERVERS <https://github.com/ruslo/hunter/wiki/usr.variables#hunter_use_cache_servers>`__
can be used to specify downloading policy.

Uploading from CI servers like Travis or AppVeyor require to store password as
an environment variable ``GITHUB_USER_PASSWORD`` (note that you can create
separate "bot" account to manage all this stuff).

Travis CI
~~~~~~~~~

Excerpts from documentation (`1 <https://docs.travis-ci.com/user/encryption-keys>`__
and `2 <https://docs.travis-ci.com/user/environment-variables/#Encrypted-Variables>`__)
for OS X  (see also `this repo <https://github.com/forexample/github-binary-release>`__):

.. code-block:: shell

  > git clone https://github.com/ingenue/hunter # your repository here
      # note that this is repository where password **will be used** in .travis.yml
      # this repository is a fork of https://github.com/ruslo/hunter
  > cd hunter
  > gem install travis # for Ubuntu it will be 'sudo gem install travis'
  > travis login --pro # in case repository is private
  > travis encrypt GITHUB_USER_PASSWORD=very-secured-password
  ...
  Please add the following to your .travis file:

  secure: "..."

If you have problems with installing ``travis`` try to install
`ruby from brew <http://stackoverflow.com/questions/31972968/cant-install-gems-on-os-x-el-capitan>`__:

.. code-block:: shell

  > brew install ruby

Now you can add secure variable to ``.travis.yml`` matrix:

.. code-block:: yaml

  env:
    global:
      - secure: "uTvW...TAE="
    matrix:
      - PROJECT_DIR=... TOOLCHAIN=...
      - PROJECT_DIR=... TOOLCHAIN=...

.. seealso::

  * `.travis.yml example <https://github.com/ingenue/hunter/blob/4f3b76832d2404c90af98c2557ec06ec7da9eb06/.travis.yml>`__

.. note::

  Instead of a password you can use GitHub token. Follow
  `those instructions <https://help.github.com/articles/creating-an-access-token-for-command-line-use/>`__
  and under the ``Select scopes`` choose ``public_repo``
  (``Access public repositories``).

.. warning::

  If you're planning to use "bot" account, login to GitHub with **bot**
  credentials.

AppVeyor
~~~~~~~~

Use `this form <https://ci.appveyor.com/tools/encrypt>`__ to encrypt your
password. I.e. put ``very-secured-password`` to this form, run ``Encrypt`` and
copy/paste results into your ``appveyor.yml`` (note that you should be logged in
as an **owner** of repository):

.. code-block:: yaml

  environment:
    global:
      GITHUB_USER_PASSWORD:
        secure: 2Sd...g==
    matrix:
      - TOOLCHAIN=...
        PROJECT_DIR=...

      - TOOLCHAIN=...
        PROJECT_DIR=...

.. seealso::

  * `appveyor.yml example <https://github.com/ingenue/hunter/blob/4f3b76832d2404c90af98c2557ec06ec7da9eb06/appveyor.yml>`__

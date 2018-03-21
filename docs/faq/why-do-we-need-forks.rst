Why do we need forks?
---------------------

:doc:`Forks </creating-new/patch>` put the burden of pushing new
branches/releases from upstream, merging and resolving conflicts by maintainers
and at the first view look like a bad, aggressively intrusive choice. But in
practice it's the clearest, robust and universal solution for all the issues
related to integration of package into Hunter.

.. note::

  Forks are not requirement. Hunterization changes can be pushed upstream
  without affecting main functionality, see
  :doc:`compatibility </overview/compatibility>` for details. And if package
  has no dependencies it **can be used as is** in Hunter,
  see :doc:`examples </creating-new/create/cmake>`.

.. note::

  As already noted :doc:`here </creating-new/patch>` all the issues that are
  not related to hunterization should be pushed upstream. Including most of
  the issues described in this section.

Solution for bundled sources
============================

Take a look at this example:

* https://github.com/dmlc/rabit/tree/0759d5ed2bfa1ecfc8f00ab955d8618db474f280/include

Here package ``rabit`` has bundled dependencies ``dmlc``. In fact ``dmlc``
folder is a separated project and lives here:

* https://github.com/dmlc/dmlc-core/tree/c0871823b518093a0d04d6cba0a3291bc7b31401/include

Assuming that we can't change the order of include paths (local includes
should have higher priority than external because different version of same
package itself can be installed in system) there is no "soft" solution here
and the only way to integrate package is **to remove** ``dmlc`` folder from
sources. In practice it means forking the project and applying "remove folder"
patch.  Note that it really doesn't depend on the package manager, build system
or C++ compiler. All C++ compilers works similar to

.. code-block:: none

  > c++ -I/path/to/local -I/path/to/external ...

Meaning ``#include <dmlc/timer.h>`` will always fall to the choice of picking
local files.

Set of patch files
==================

Another way to avoid forks is to keep needed ``*.patch`` files in Hunter and
apply them to upstream releases before running build instructions. Such approach
used by `Homebrew <https://brew.sh/>`__ and `Gentoo <https://gentoo.org/>`__
for example. In practice such set of patches can be quite big, e.g. 19 commits
for package ``OpenCV`` (add ``HunterGate`` module, lock version in
``HunterGate``, adding ``hunter_add_package`` calls, applying ``ANDROID_*``
variables introduced by new CMake version and general improvements):

* https://github.com/hunter-packages/opencv/pull/21/commits

Note that Hunter keep all available ``OpenCV`` versions in
``cmake/projects/OpenCV/hunter.cmake`` file:

* https://github.com/ruslo/hunter/blob/e412a3a1e9d58056efb56cb75440aead83f2e9e5/cmake/projects/OpenCV/hunter.cmake

At this moment there are 29 versions of ``OpenCV`` available for users, hence
it will be 19 x 29 = 551 ``*.patch`` files to maintain. Some of them can be
shared between versions, some of them can be fused with each other, etc.
If such approach will be chosen we will end up with system for maintaining
patches, but there is no need to reinvent the wheel, such system already
exist and called ``Git``. Assuming the fact that Hunter project hosted on
GitHub and GitHub offer free unlimited repositories for public projects there
are no real reasons to choose ``*.patch`` approach over forks.

High cohesion
=============

High cohesion means that you should keep parts of a code base that are related
to each other in a single place [1]_. The fact that version ``v1.0`` of package
``Foo`` works fine with Hunter archive ``v0.10`` is perfectly expressed by
adding child commit ``Add Hunter v0.10`` to parent commit ``Foo v1.0``. Change
of dependencies from version to version is another example.

``Foo`` version ``v1.0``:

.. literalinclude:: foo-v1.0.cmake
  :language: cmake

``Foo`` version ``v2.0``:

.. literalinclude:: foo-v2.0.cmake
  :language: cmake

It's hard to make a mistake in both cases:

.. literalinclude:: foo-v1.0-hunter.cmake
  :diff: foo-v1.0.cmake

.. literalinclude:: foo-v2.0-hunter.cmake
  :diff: foo-v2.0.cmake

It will be much easier to miss something while trying to support any
fork-free approach:

.. code-block:: cmake

  if(FOO_VERSION VERSION_EQUAL 1.0 AND WIN32)
    magic_download(boo)
  endif()

  if(FOO_VERSION VERSION_EQUAL 2.0 AND FOO_WITH_BAZ)
    magic_download(baz)
  endif()

  magic_download(bar)

Any non-CMake custom build scheme suffers from this problem since build
instructions have to know everything about all versions available,
e.g. see
`Boost components <https://github.com/ruslo/hunter/blob/bd8b7cddeb74ea3bda67401a23aee0db8702fc9e/cmake/modules/hunter_get_boost_libs.cmake#L52-L82>`__
.

.. [1] http://enterprisecraftsmanship.com/2015/09/02/cohesion-coupling-difference/

Rejected/pending CMake patches
==============================

Having CMake build instructions in package is the easiest way to integrate
package into Hunter (but not the only one) however
`not all developers of the upstream projects are ready to accept CMake code <https://github.com/technion/libscrypt/pull/43>`__
because it may put burden
on maintaining another build system (if CMake added as extra build system),
learning new build system (if you want to substitute existing system with CMake)
or increase CMake minimum version to introduce new code.
https://github.com/hunter-packages is a central place where CMake friendly code
can leave and shared with others.

Removing usage of FindXXX.cmake
===============================

Overwhelming majority of projects use ``FindXXX.cmake`` (or even something like
``find_library``) instead of recommended ``XXXConfig.cmake`` approach,
effectively making project non-relocatable. It's not a problem for the package
managers that are using single-root directory (e.g. ``/usr/lib`` for
``apt-get`` on Ubuntu and ``/usr/local/lib`` for ``brew`` on OSX) but since
Hunter allow to have
:doc:`multiple custom configurations </overview/customization>`
it will not work.

.. seealso::

  * :ref:`Creating new package: Install XXXConfig.cmake <create new install xxxconfig>`

.. admonition:: CGold

  * `Rejected: FindXXX.cmake <http://cgold.readthedocs.io/en/latest/rejected/find-modules.html>`__

Lock URL/SHA1 in HunterGate
===========================

Even if all the issues will be resolved and
:doc:`'hunter_add_package' will be called by hook inside 'find_package' </faq/why-do-we-need-hunter-add-package>`
it's still will be convenient to save latest successful 3rd parties
configuration for debugging purposes. In terms of Hunter it means attaching
URL/SHA1 arguments of ``HunterGate`` to some commit.

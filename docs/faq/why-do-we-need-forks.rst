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

.. admonition:: TODO

  There will be more examples here

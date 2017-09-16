import os
import subprocess

# hardcoded paths
HUNTER_DIR='..'
PACKAGES_DIR=os.path.join(HUNTER_DIR, 'cmake/projects')
DOCS_PKG_DIR=os.path.join(HUNTER_DIR, 'docs', 'packages', 'pkg')

# get all wiki entries
docs_filenames = [x for x in os.listdir(DOCS_PKG_DIR) if x.endswith('.rst')]
docs_entries = [x[:-4] for x in docs_filenames]

# get all hunter package entries   
pkg_entries = [x for x in os.listdir(PACKAGES_DIR) if os.path.isdir(os.path.join(PACKAGES_DIR, x))]
pkg_entries_lower = [x.lower() for x in pkg_entries]

# packages both in hunter and wiki
pkg_match = [x for x in pkg_entries if x in docs_entries]
# packages only in hunter
pkg_only_hunter = [x for x in pkg_entries if x not in pkg_match]

# output directories
packages_dir = 'packages'
only_hunter_dir = 'packages/only_hunter'

# create if not exist
for d in [packages_dir, only_hunter_dir]:
    if not os.path.exists(d):
        os.mkdir(d)

# header for rst files
header_format_string = """.. spelling::

    {}

.. index:: unsorted ; {}

.. _pkg.{}:

{}
{}
"""

template_string = """
.. warning::

    This page is a template and contains no real information.
    Please send pull request with real description.

-  `__FIXME__ Official <https://__FIXME__>`__
-  `__FIXME__ Hunterized <https://github.com/hunter-packages/__FIXME__>`__
-  `__FIXME__ Example <https://github.com/ruslo/hunter/blob/master/examples/__FIXME__/CMakeLists.txt>`__
-  Available since `__FIXME__ vX.Y.Z <https://github.com/ruslo/hunter/releases/tag/vX.Y.Z>`__
-  Added by `__FIXME__ <https://github.com/__FIXME__>`__ (`__FIXME__ pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(__FIXME__)
    find_package(__FIXME__ CONFIG REQUIRED)
    target_link_libraries(foo __FIXME__::__FIXME__)

"""


# create dummy entries for packages only in hunter
for entry in pkg_only_hunter:
    target_rst = os.path.join(only_hunter_dir, entry + '.rst')

    underscores = "=" * len(entry)
    header = header_format_string.format(entry, entry, entry, entry, underscores)
    #print(header)

    with open(target_rst, 'w') as f:
        f.write(header)
        f.write(template_string)

print("pkg_match entries:       ", len(pkg_match))
print("pkg_only_hunter entries: ", len(pkg_only_hunter))

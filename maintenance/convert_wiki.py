import os
import subprocess

# hardcoded paths
HUNTER_DIR='..'
WIKI_DIR=os.path.join(HUNTER_DIR, '..', 'hunter.wiki')
PACKAGES_DIR=os.path.join(HUNTER_DIR, 'cmake/projects')

# get all wiki entries
wiki_filenames = [x for x in os.listdir(WIKI_DIR) if x.startswith('pkg.') and x.endswith('.md')]
wiki_entries = [x[4:-3] for x in wiki_filenames]

# get all hunter package entries   
pkg_entries = [x for x in os.listdir(PACKAGES_DIR) if os.path.isdir(os.path.join(PACKAGES_DIR, x))]
pkg_entries_lower = [x.lower() for x in pkg_entries]

# packages both in hunter and wiki
pkg_match = [x for x in pkg_entries if x.lower() in wiki_entries]
# packages only in hunter
pkg_only_hunter = [x for x in pkg_entries if x not in pkg_match]
# packages only in wiki
pkg_only_wiki = [x for x in wiki_entries if x not in pkg_entries_lower]

# output directories
packages_dir = 'packages'
pkg_dir = 'packages/pkg'
tmp_dir = 'packages/tmp'
only_hunter_dir = 'packages/only_hunter'
only_wiki_dir = 'packages/only_wiki'

# create if not exist
for d in [packages_dir, pkg_dir, tmp_dir, only_hunter_dir, only_wiki_dir]:
    if not os.path.exists(d):
        os.mkdir(d)

# header for rst files
header_format_string = """.. spelling::

    {}

.. _pkg.{}:

{}
{}

"""

template_string = """.. warning::

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

def append_file(f, input_file):
    with open(input_file, 'r') as tmp:
        for line in tmp.readlines():
            if line.startswith('.. code::'):
                if line[9:] == ' yml\n':
                    line = '.. code-block::' + ' yaml\n'
                else:
                    line = '.. code-block::' + line[9:]
            f.write(line)

# convert matching entries
for entry in pkg_match:
    source_md = os.path.join(WIKI_DIR, 'pkg.' + entry.lower() + '.md')
    tmp_rst = os.path.join(tmp_dir, entry + '.rst')
    target_rst = os.path.join(pkg_dir, entry + '.rst')
    
    underscores = "=" * len(entry)
    header = header_format_string.format(entry, entry, entry, underscores)
    #print(header)
    cmd = ['pandoc', source_md, '-o', tmp_rst]
    print("cmd: ", cmd)
    subprocess.call(cmd)
    
    with open(target_rst, 'w') as f:
        f.write(header)
        append_file(f, tmp_rst)

# create dummy entries for packages only in hunter
for entry in pkg_only_hunter:
    source_md = os.path.join(WIKI_DIR, 'pkg.' + entry.lower() + '.md')
    tmp_rst = os.path.join(tmp_dir, entry + '.rst')
    target_rst = os.path.join(only_hunter_dir, entry + '.rst')
    
    underscores = "=" * len(entry)
    header = header_format_string.format(entry, entry, entry, underscores)
    #print(header)
     
    with open(target_rst, 'w') as f:
        f.write(header)
        f.write(template_string)

# convert wiki entry, put in extra folder
for entry in pkg_only_wiki:
    source_md = os.path.join(WIKI_DIR, 'pkg.' + entry + '.md')
    tmp_rst = os.path.join(tmp_dir, entry + '.rst')
    target_rst = os.path.join(only_wiki_dir, entry + '.rst')
    
    underscores = "=" * len(entry)
    header = header_format_string.format(entry, entry, entry, underscores)
    #print(header)
    cmd = ['pandoc', source_md, '-o', tmp_rst]
    print("cmd: ", cmd)
    subprocess.call(cmd)
    
    with open(target_rst, 'w') as f:
        f.write(header)
        f.write("File only available in wiki.\n"
                "Please merge with hunter-package entry\n\n")
        append_file(f, tmp_rst)

print("pkg_match entries:       ", len(pkg_match))
print("pkg_only_hunter entries: ", len(pkg_only_hunter))
print("pkg_only_wiki entries:   ", len(pkg_only_wiki))
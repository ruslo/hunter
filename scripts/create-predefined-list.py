#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

import argparse
import os
import re
import subprocess
import urllib.request

argparser = argparse.ArgumentParser(
    description="""
        Create C++ source file `ShowPredefined.cpp` which will be used to verify
        toolchain compatibility.
    """
)

argparser.add_argument(
    '--raw',
    help="""
        File with raw list of macroses (used simultaneously as initial list and
        file to append result list)
    """
)

argparser.add_argument(
    '--site',
    help="""
        Read macroses <strong>_...</strong> from site.
        Example: http://msdn.microsoft.com/en-us/library/b0084kay.aspx
    """
)

argparser.add_argument(
    '--compiler',
    help="""
        GCC-like unix compiler that accept syntax: '-E -x c++ -dM /dev/null'
    """
)

argparser.add_argument(
    '--arch',
    help="""
        Architecture for compiler (e.g. armv7, armv7s, arm64, i386, x86_64, ...)
    """
)

argparser.add_argument(
    '--boost-predef',
    action='store_true',
    help="""
        Read macroses from repository: https://github.com/boostorg/predef
    """
)

args = argparser.parse_args()

# This macroses is not quite helpful
exclude_list = [
    '__DATE__',
    '__FILE__',
    '__LINE__',
    '__TIME__',
    '__TIMESTAMP__',
    '__NO_INLINE__',
    '_DEBUG',
    '__FUNCTION__',
]

macros_list = []
if args.raw:
  data = open(args.raw, "r").read()
  macros_list += data.split()

if args.site:
  content = urllib.request.urlopen(args.site).read().decode('utf-8')
  parsed = re.findall('<strong>_[^<]*</strong>', content)
  for x in parsed:
    macros_list.append(re.sub(r'<strong>(.*)</strong>', r'\1', x))

if args.boost_predef:
  temp_dir = os.path.join(os.getcwd(), '__temp-git-predef')
  if not os.path.exists(temp_dir):
    subprocess.check_call(
        ['git', 'clone', 'https://github.com/boostorg/predef', temp_dir]
    )
  gitdir = os.path.join(temp_dir, '.git')
  docdir = os.path.join(temp_dir, 'doc')

  assert(os.path.exists(gitdir))
  assert(os.path.exists(docdir))

  macro = re.compile(r'\bdefined\(_[^)]*\)')
  boost_macro_list = []
  for root, dirs, files in os.walk(temp_dir):
    if root.startswith(gitdir):
      continue
    if root.startswith(docdir):
      continue
    for x in files:
      filename = os.path.join(root, x)
      boost_macro_list += macro.findall(open(filename).read())
  boost_macro_list = list(set(boost_macro_list))
  macros_list += [
      re.sub(r'^defined\((.*)\)$', r'\1', x) for x in boost_macro_list
  ]

if args.compiler:
  run_args = [args.compiler, '-E', '-x', 'c++', '-dM', '/dev/null']
  if args.arch:
    run_args += ['-arch', args.arch]
  macroses = subprocess.check_output(run_args, universal_newlines=True)
  compiler_macro_list = macroses.split('\n')
  for x in compiler_macro_list:
    if re.match(r'^#define _', x):
      macros_list.append(re.sub(r'^#define ([^ (]*).*', r'\1', x))

macros_list = sorted(set(macros_list))
for to_exclude in exclude_list:
  if to_exclude in macros_list:
    macros_list.remove(to_exclude)

for x in macros_list:
  print("> {}".format(x))

if args.raw:
  result_fl = open(args.raw, 'w')
  for macro in macros_list:
    result_fl.write('{}\n'.format(macro))

cpp_head = """
// This file generated automatically by `create-predefined-list.py` script.
// * https://github.com/ruslo/hunter

#define HUNTER_QUOTE(x) #x
#define HUNTER_STRING(x) HUNTER_QUOTE(x)
#define HUNTER_INFO(x) \\
    "__HUNTER_MACRO_CHECK_BEGIN__" \\
    "#define " #x " " HUNTER_STRING(x) \\
    "__HUNTER_MACRO_CHECK_END__"

#include <exception> // Check std library version

#if defined(__ANDROID__)
# include <android/api-level.h> // Header with __ANDROID_API__
#endif
"""

cpp_one_check = """
#if defined({})
# pragma message(HUNTER_INFO({}))
#endif
"""

# http://clang.llvm.org/docs/AddressSanitizer.html#conditional-compilation-with-has-feature-address-sanitizer
sanitize_detect_check = """
#if defined(__has_feature)
# if __has_feature({}_sanitizer)
#  pragma message(HUNTER_INFO(__HUNTER_DETECT_FEATURE_{}_sanitizer))
# endif
#endif
"""

sanitizers_list = [
    'address',
#    'leak', # Not detected!
    'memory',
    'thread'
]

cpp_end = """
int main() {
}
"""

if macros_list:
  cpp_result = open('ShowPredefined.cpp', 'w')
  cpp_result.write(cpp_head)
  for x in macros_list:
    cpp_result.write(cpp_one_check.format(x, x))
  for x in sanitizers_list:
    cpp_result.write(sanitize_detect_check.format(x, x))
  cpp_result.write(cpp_end)

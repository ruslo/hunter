#!/usr/bin/env python3

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

import argparse
import glob
import os
import re
import subprocess
import sys

parser = argparse.ArgumentParser(description='Fix boost dynamic libraries id')
parser.add_argument(
    '--install-dir', required=True, help='Libraries install directory'
)

args = parser.parse_args()

install_dir = os.path.abspath(args.install_dir)
if not os.path.exists(install_dir):
  sys.exit("Directory '{}' not found".format(install_dir))
pattern = install_dir + '/libboost_*.dylib'

for fix_dylib in glob.glob(pattern):
  subprocess.check_call(['install_name_tool', '-id', fix_dylib, fix_dylib])
  output = subprocess.check_output(
      ['otool', '-L', fix_dylib], universal_newlines=True
  )
  dependent_list = output.split('\n')[:-1] # remove last
  for dependent_dylib in dependent_list:
    if dependent_dylib.startswith('\tlibboost_'):
      libname = re.sub(r'\t(libboost_.*.dylib) .*', r'\1', dependent_dylib)
      libname_path = install_dir + '/' + libname
      subprocess.check_call(
          ['install_name_tool', '-change', libname, libname_path, fix_dylib]
      )

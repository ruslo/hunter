#!/usr/bin/env python3

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

import argparse
import glob
import os
import platform
import re
import shutil
import subprocess
import sys

parser = argparse.ArgumentParser(description="Run all tests")

parser.add_argument('--include', nargs='*', type=str)

args = parser.parse_args()

class Log:
  def __init__(self):
    pass
  def p(self, message):
    print('##### {}'.format(message))

class Backup:
  def __init__(self, origin_location, save_location, save_dir):
    self.origin_location = origin_location
    self.save_location = save_location
    self.save_dir = save_dir
    log.p(
         'save downloaded file: {} -> {}'.format(
             self.origin_location, self.save_location
         )
    )
    shutil.copyfile(self.origin_location, self.save_location)

  def restore(self):
    log.p(
         'restore downloaded file: {} -> {}'.format(
             self.save_location, self.origin_location
         )
    )
    os.makedirs(self.save_dir)
    shutil.copyfile(self.save_location, self.origin_location)

def rmtree_workaround(directory):
  if not os.path.exists(directory):
    return
  if os.name == 'nt':
    # Fix windows error: `path too long`
    os.system('rmdir {} /s /q'.format(directory))
  else:
    shutil.rmtree(directory)

log = Log()

testing_dirs = []
if not args.include:
  for project in glob.iglob('*/CMakeLists.txt'):
    project = os.path.normpath(project)
    if os.path.exists(os.path.join(os.path.dirname(project), 'Xcode')):
      if not platform.system() == 'Darwin':
        continue
    testing_dirs.append(project)
else:
  for incl in args.include:
    project = os.path.join(os.path.normpath(incl), 'CMakeLists.txt')
    if not os.path.exists(project):
      sys.exit('Project not found: `{}`'.format(project))
    if os.path.exists(os.path.join(os.path.dirname(project), 'Xcode')):
      if not platform.system() == 'Darwin':
        continue
    testing_dirs.append(project)

if not testing_dirs:
  log.p('No projects to run')
  sys.exit()

for x in testing_dirs:
  log.p('Add to testing: {}'.format(x))

top_dir = os.getcwd()
for project in testing_dirs:
  os.chdir(os.path.dirname(project))
  toolchain_path = os.path.abspath('toolchain.cmake')

  if os.path.exists(toolchain_path):
    toolchain_option = '-DCMAKE_TOOLCHAIN_FILE={}'.format(toolchain_path)
  else:
    toolchain_option = ''

  if os.path.exists('Xcode'):
    generator = '-GXcode'
  else:
    generator = ''

  do_test = os.path.exists('dotest')

  # 1. save downloaded archive
  # 2. remove build directories
  # 3. copy downloaded archive back
  archive_list = []

  if os.path.exists('_builds'):
    for root, dirs, files in os.walk(
        os.path.join('_builds', '_3rdParty', '_hunter_base', 'Download')
    ):
      for x in files:
        backup = Backup(os.path.join(root, x), x, root)
        archive_list.append(backup)
    rmtree_workaround('_builds')
  for x in archive_list:
    x.restore()
  if not os.path.exists('_builds'):
    os.mkdir('_builds')
  os.chdir('_builds')
  subprocess.check_call(['cmake', generator, toolchain_option, '..'])
  if do_test:
    subprocess.check_call(['cmake', '--build', '.'])
    subprocess.check_call(['ctest', '.'])

  os.chdir(top_dir)

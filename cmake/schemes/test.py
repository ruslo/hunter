#!/usr/bin/env python3

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

import argparse
import glob
import os
import platform
import random
import re
import shutil
import string
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

log = Log()

def rmtree_workaround(directory):
  if not os.path.exists(directory):
    return
  if os.name == 'nt':
    # Fix windows error: `path too long`
    os.system('rmdir {} /s /q'.format(directory))
  else:
    shutil.rmtree(directory)

def name_generator():
  chars = string.ascii_uppercase + string.ascii_lowercase + string.digits
  return ''.join(random.choice(chars) for _ in range(10))

class Excluded:
  def __init__(self):
    self.exclude_projects = []

  def add(self, directory):
    self.exclude_projects.append(
        os.path.join('tests', directory, 'CMakeLists.txt')
    )

  def hit(self, project):
    return (project in self.exclude_projects)

excluded = Excluded()

if platform.system() != 'Darwin':
  excluded.add('url_sha1_boost_ios_library')
  excluded.add('url_sha1_combined_release_debug') # Xcode only
  excluded.add('url_sha1_openssl_ios')

if platform.system() == 'Windows':
  excluded.add('url_sha1_openssl')
  excluded.add('url_sha1_openssl_ios')
  excluded.add('url_sha1_release_debug') # Xcode only

testing_dirs = []
if not args.include:
  for project in glob.iglob('tests/*/CMakeLists.txt'):
    if not excluded.hit(project):
      testing_dirs.append(project)
else:
  for incl in args.include:
    project = os.path.join(os.path.normpath(incl), 'CMakeLists.txt')
    if not os.path.exists(project):
      sys.exit('Project not found: `{}`'.format(project))
    if not excluded.hit(project):
      testing_dirs.append(project)

if not testing_dirs:
  log.p("No projects to run")
  sys.exit()

for x in testing_dirs:
  log.p('Add to testing: {}'.format(x))

top_dir = os.getcwd()
for project in testing_dirs:
  os.chdir(os.path.dirname(project))
  rmtree_workaround('_builds')

  junctions = os.getenv('HUNTER_JUNCTIONS')
  build_dir = os.path.join(os.getcwd(), '_builds')
  os.mkdir(build_dir)
  if junctions and os.name == 'nt':
    new_dir = os.path.join(junctions, name_generator())
    os.system('mklink /J {} {}'.format(new_dir, build_dir))
    build_dir = new_dir

  args = [
      'cmake',
      '-H.',
      '-B{}'.format(build_dir),
      '-DHUNTER_STATUS_DEBUG=ON'
  ]
  subprocess.check_call(args)
  os.chdir(top_dir)

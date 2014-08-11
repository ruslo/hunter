#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import os
import subprocess
import sys
import tempfile
import shutil

def run():
  cdir = os.getcwd()
  hunter_root = cdir

  toolchain = os.getenv('TOOLCHAIN')
  if not toolchain:
    sys.exit('Environment variable TOOLCHAIN is empty')

  config = os.getenv('CONFIG')
  if not config:
    sys.exit('Environment variable CONFIG is empty')

  project_dir = os.getenv('PROJECT_DIR')
  if not project_dir:
    sys.exit('Expected environment variable PROJECT_DIR')
  project_dir = os.path.join(cdir, project_dir)
  project_dir = os.path.normpath(project_dir)

  testing_dir = os.path.join(os.getcwd(), '_testing')
  if os.name == 'nt':
    hunter_junctions = os.getenv('HUNTER_JUNCTIONS')
    if hunter_junctions:
      testing_dir = tempfile.mkdtemp(dir=hunter_junctions)

  build_dir = os.path.join(testing_dir, 'Build')
  download_dir = os.path.join(testing_dir, 'Downloads')
  base_dir = os.path.join(testing_dir, 'Base')

  build_script = 'build.py'
  if os.name == 'nt':
    which = 'where'
  else:
    which = 'which'

  build_script = subprocess.check_output(
      [which, 'build.py'], universal_newlines=True
  ).split('\n')[0]

  print('Testing in: {}'.format(testing_dir))

  os.mkdir(build_dir)
  os.chdir(build_dir)

  args = [
      sys.executable,
      build_script,
      '--verbose',
      '--clear',
      '--toolchain',
      toolchain,
      '--config',
      config,
      '--home',
      project_dir,
      '--fwd',
      'HUNTER_ROOT={}'.format(hunter_root),
      'HUNTER_BASE={}'.format(base_dir),
      'HUNTER_PACKAGE_DOWNLOAD_DIR={}'.format(download_dir)
  ]

  print('Execute command: [')
  for i in args:
    print('  `{}`'.format(i))
  print(']')

  subprocess.check_call(args)
  shutil.rmtree(testing_dir, ignore_errors=True)

if __name__ == "__main__":
  run()

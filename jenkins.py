#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import os
import subprocess
import sys

def run():
  toolchain = os.getenv('TOOLCHAIN')
  if not toolchain:
    sys.exit('Environment variable TOOLCHAIN is empty')

  config = os.getenv('CONFIG')
  if not config:
    sys.exit('Environment variable CONFIG is empty')

  project_dir = os.getenv('PROJECT_DIR')
  if not project_dir:
    sys.exit('Expected environment variable PROJECT_DIR')
  project_dir = os.path.normpath(project_dir)

  cdir = os.getcwd()
  testing_dir = os.path.join(cdir, '_testing')
  download_dir = os.path.join(testing_dir, 'Downloads')
  base_dir = os.path.join(testing_dir, 'Base')
  args = [
      'build.py',
      '--verbose',
      '--clear',
      '--toolchain',
      toolchain,
      '--config',
      config,
      '--home',
      project_dir,
      '--fwd',
      'HUNTER_ROOT={}'.format(cdir),
      'HUNTER_BASE={}'.format(base_dir),
      'HUNTER_PACKAGE_DOWNLOAD_DIR={}'.format(download_dir)
  ]

  print('Execute command: [')
  for i in args:
    print('  `{}`'.format(i))
  print(']')

  subprocess.check_call(args)

if __name__ == "__main__":
  run()

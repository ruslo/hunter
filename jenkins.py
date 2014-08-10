#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import os
import subprocess
import sys

def run():
  project_dir = os.getenv('PROJECT_DIR')
  if not project_dir:
    sys.exit('Expected environment variable PROJECT_DIR')
  project_dir = os.path.normpath(project_dir)
  cache_file = os.path.join(project_dir, 'cache.cmake')
  cdir = os.getcwd()
  testing_dir = os.path.join(cdir, '_testing')
  download_dir = os.path.join(testing_dir, 'Downloads')
  base_dir = os.path.join(testing_dir, 'Base')
  build_dir = os.path.join(testing_dir, '_builds')
  args = [
      'cmake',
      '-H{}'.format(project_dir),
      '-B{}'.format(build_dir),
      '-DHUNTER_ROOT={}'.format(cdir),
      '-DHUNTER_BASE={}'.format(base_dir),
      '-DHUNTER_STATUS_DEBUG=ON',
      '-DCMAKE_VERBOSE_MAKEFILE=ON',
      '-DHUNTER_PACKAGE_DOWNLOAD_DIR={}'.format(download_dir)
  ]
  if os.path.exists(cache_file):
    args.append('-C{}'.format(cache_file))

  print('Execute command: [')
  for i in args:
    print('  `{}`'.format(i))
  print(']')

  subprocess.check_call(args)
  subprocess.check_call(['cmake', '--build', build_dir])

if __name__ == "__main__":
  run()

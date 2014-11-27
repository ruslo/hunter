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

  project_dir = os.getenv('PROJECT_DIR')
  if not project_dir:
    sys.exit('Expected environment variable PROJECT_DIR')

  # Check broken builds --
  if (project_dir == 'examples/Boost-filesystem') and (toolchain == 'analyze'):
    print('Skip (https://github.com/ruslo/hunter/issues/25)')
    sys.exit(0)

  if (project_dir == 'examples/Boost-system') and (toolchain == 'analyze'):
    print('Skip (https://github.com/ruslo/hunter/issues/26)')
    sys.exit(0)

  if (project_dir == 'examples/Boost') and (toolchain == 'mingw'):
    print('Skip (https://github.com/ruslo/hunter/issues/27)')
    sys.exit(0)

  if (project_dir == 'examples/Boost-system') and (toolchain == 'mingw'):
    print('Skip (https://github.com/ruslo/hunter/issues/27)')
    sys.exit(0)

  if (project_dir == 'examples/Boost-filesystem') and (toolchain == 'mingw'):
    print('Skip (https://github.com/ruslo/hunter/issues/27)')
    sys.exit(0)

  if (project_dir == 'examples/OpenSSL') and (toolchain == 'mingw'):
    print('Skip (https://github.com/ruslo/hunter/issues/28)')
    sys.exit(0)

  if (project_dir == 'examples/OpenSSL') and (toolchain == 'ios-7-0'):
    print('Skip (https://github.com/ruslo/hunter/issues/29)')
    sys.exit(0)

  if (project_dir == 'examples/OpenSSL') and (toolchain == 'xcode'):
    print('Skip (https://github.com/ruslo/hunter/issues/30)')
    sys.exit(0)
  # -- end

  verbose = True
  if (
      os.getenv('TRAVIS') and
      (project_dir == 'examples/CLAPACK') and
      (toolchain == 'xcode')
  ):
    verbose = False

  project_dir = os.path.join(cdir, project_dir)
  project_dir = os.path.normpath(project_dir)

  testing_dir = os.path.join(os.getcwd(), '_testing')
  os.makedirs(testing_dir, exist_ok=True)

  if os.name == 'nt':
    hunter_junctions = os.getenv('HUNTER_JUNCTIONS')
    if hunter_junctions:
      temp_dir = tempfile.mkdtemp(dir=hunter_junctions)
      shutil.rmtree(temp_dir)
      subprocess.check_output(
          "cmd /c mklink /J {} {}".format(temp_dir, testing_dir)
      )
      testing_dir = temp_dir

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

  os.makedirs(build_dir, exist_ok=True)
  os.chdir(build_dir)

  args = [
      sys.executable,
      build_script,
      '--clear',
      '--toolchain',
      toolchain,
      '--home',
      project_dir,
      '--fwd',
      'HUNTER_ROOT={}'.format(hunter_root),
      'HUNTER_BASE={}'.format(base_dir),
      'HUNTER_PACKAGE_DOWNLOAD_DIR={}'.format(download_dir)
  ]

  if verbose:
    args += ['--verbose']

  print('Execute command: [')
  for i in args:
    print('  `{}`'.format(i))
  print(']')

  subprocess.check_call(args)

if __name__ == "__main__":
  run()

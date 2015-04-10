#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import hashlib
import os
import shutil
import subprocess
import sys
import tarfile
import tempfile

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

  hunter_url = os.path.join(testing_dir, 'hunter.tar.gz')
  arch = tarfile.open(hunter_url, 'w:gz')
  arch.add('cmake')
  arch.add('scripts')
  arch.close()

  hunter_sha1 = hashlib.sha1(open(hunter_url, 'rb').read()).hexdigest()

  hunter_root = os.path.join(testing_dir, 'Hunter')

  build_script = 'build.py'
  if os.name == 'nt':
    which = 'where'
  else:
    which = 'which'

  build_script = subprocess.check_output(
      [which, 'build.py'], universal_newlines=True
  ).split('\n')[0]

  print('Testing in: {}'.format(testing_dir))
  os.chdir(testing_dir)

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
      'TESTING_URL={}'.format(hunter_url),
      'TESTING_SHA1={}'.format(hunter_sha1),
      'HUNTER_RUN_INSTALL=ON'
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

#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import argparse
import hashlib
import os
import shutil
import subprocess
import sys
import tarfile
import tempfile
import time

def clear_except_download(hunter_root):
  base_dir = os.path.join(hunter_root, '_Base')
  if os.path.exists(base_dir):
    print('Clearing directory: {}'.format(base_dir))
    hunter_download_dir = os.path.join(base_dir, 'Download', 'Hunter')
    if os.path.exists(hunter_download_dir):
      shutil.rmtree(hunter_download_dir)
    for filename in os.listdir(base_dir):
      if filename != 'Download':
        to_remove = os.path.join(base_dir, filename)
        if os.name == 'nt':
          # Fix "path too long" error
          subprocess.check_call(['cmd', '/c', 'rmdir', to_remove, '/S', '/Q'])
        else:
          shutil.rmtree(to_remove)

def run():
  parser = argparse.ArgumentParser("Testing script")
  parser.add_argument(
      '--nocreate',
      action='store_true',
      help='Do not create Hunter archive (reusing old)'
  )
  parser.add_argument(
      '--all-release',
      action='store_true',
      help='Release build type for all 3rd party packages'
  )
  parser.add_argument(
      '--clear',
      action='store_true',
      help='Remove old testing directories'
  )
  parser.add_argument(
      '--clear-except-download',
      action='store_true',
      help='Remove old testing directories except `Download` directory'
  )
  parser.add_argument(
      '--disable-builds',
      action='store_true',
      help='Disable building of package (useful for checking package can be loaded from cache)'
  )
  parser.add_argument(
      '--upload',
      action='store_true',
      help='Upload cache to server and run checks (clean up will be triggered, same as --clear-except-download)'
  )

  parsed_args = parser.parse_args()

  if parsed_args.upload:
    password = os.getenv('GITHUB_USER_PASSWORD')
    if password is None:
      sys.exit('Expected environment variable GITHUB_USER_PASSWORD on uploading')

  cdir = os.getcwd()
  hunter_root = cdir

  toolchain = os.getenv('TOOLCHAIN')
  if not toolchain:
    sys.exit('Environment variable TOOLCHAIN is empty')

  project_dir = os.getenv('PROJECT_DIR')
  if not project_dir:
    sys.exit('Expected environment variable PROJECT_DIR')

  ci = os.getenv('TRAVIS') or os.getenv('APPVEYOR')
  if (ci and toolchain == 'dummy'):
    print('Skip build: CI dummy (workaround)')
    sys.exit(0)

  verbose = True
  env_verbose = os.getenv('VERBOSE')
  if env_verbose:
    if env_verbose == '0':
      verbose = False
    elif env_verbose == '1':
      verbose = True
    else:
      sys.exit(
          'Environment variable VERBOSE: expected 0 or 1, got "{}"'.format(
              env_verbose
          )
      )

  project_dir = os.path.join(cdir, project_dir)
  project_dir = os.path.normpath(project_dir)

  testing_dir = os.path.join(os.getcwd(), '_testing')
  if os.path.exists(testing_dir) and parsed_args.clear:
    print('REMOVING: {}'.format(testing_dir))
    shutil.rmtree(testing_dir)
  os.makedirs(testing_dir, exist_ok=True)

  if os.name == 'nt':
    # path too long workaround
    hunter_junctions = os.getenv('HUNTER_JUNCTIONS')
    if hunter_junctions:
      temp_dir = tempfile.mkdtemp(dir=hunter_junctions)
      shutil.rmtree(temp_dir)
      subprocess.check_output(
          "cmd /c mklink /J {} {}".format(temp_dir, testing_dir)
      )
      testing_dir = temp_dir

  hunter_url = os.path.join(testing_dir, 'hunter.tar.gz')

  if parsed_args.nocreate:
    if not os.path.exists(hunter_url):
      sys.exit('Option `--nocreate` but no archive')
  else:
    arch = tarfile.open(hunter_url, 'w:gz')
    arch.add('cmake')
    arch.add('scripts')
    arch.close()

  hunter_sha1 = hashlib.sha1(open(hunter_url, 'rb').read()).hexdigest()

  hunter_root = os.path.join(testing_dir, 'Hunter')

  if parsed_args.clear_except_download:
    clear_except_download(hunter_root)

  if os.name == 'nt':
    which = 'where'
  else:
    which = 'which'

  polly_root = os.getenv('POLLY_ROOT')
  if polly_root:
    polly_root = os.path.abspath(polly_root)
    print('Using POLLY_ROOT: {}'.format(polly_root))
    build_script = os.path.join(polly_root, 'bin', 'build.py')
  else:
    build_script = subprocess.check_output(
        [which, 'build.py'], universal_newlines=True
    ).split('\n')[0]

  if not os.path.exists(build_script):
    sys.exit('Script not found: {}'.format(build_script))

  print('Testing in: {}'.format(testing_dir))
  os.chdir(testing_dir)

  args = [
      sys.executable,
      build_script,
      '--clear',
      '--config',
      'Release',
      '--toolchain',
      toolchain,
      '--home',
      project_dir,
      '--fwd',
      'CMAKE_POLICY_DEFAULT_CMP0069=NEW',
      'HUNTER_SUPPRESS_LIST_OF_FILES=ON',
      'HUNTER_ROOT={}'.format(hunter_root),
      'TESTING_URL={}'.format(hunter_url),
      'TESTING_SHA1={}'.format(hunter_sha1)
  ]

  if not parsed_args.nocreate:
    args += ['HUNTER_RUN_INSTALL=ON']

  if parsed_args.disable_builds:
    args += ['HUNTER_DISABLE_BUILDS=ON']

  if parsed_args.all_release:
    args += ['HUNTER_CONFIGURATION_TYPES=Release']

  if parsed_args.upload:
    passwords = os.path.join(
        cdir, 'maintenance', 'upload-password-template.cmake'
    )
    args += ['HUNTER_RUN_UPLOAD=ON']
    args += ['HUNTER_PASSWORDS_PATH={}'.format(passwords)]

  args += ['--verbose']
  if not verbose:
    args += ['--discard', '10']
    args += ['--tail', '200']

  print('Execute command: [')
  for i in args:
    print('  `{}`'.format(i))
  print(']')

  subprocess.check_call(args)

  if parsed_args.upload:
    seconds = 60
    print(
        'Wait for GitHub changes became visible ({} seconds)...'.format(seconds)
    )
    time.sleep(seconds)

    print('Run sanity build')

    clear_except_download(hunter_root)

    # Sanity check - run build again with disabled building from sources
    args = [
        sys.executable,
        build_script,
        '--clear',
        '--verbose',
        '--config',
        'Release',
        '--toolchain',
        toolchain,
        '--home',
        project_dir,
        '--fwd',
        'HUNTER_DISABLE_BUILDS=ON',
        'HUNTER_USE_CACHE_SERVERS=ONLY',
        'CMAKE_POLICY_DEFAULT_CMP0069=NEW',
        'HUNTER_SUPPRESS_LIST_OF_FILES=ON',
        'HUNTER_ROOT={}'.format(hunter_root),
        'TESTING_URL={}'.format(hunter_url),
        'TESTING_SHA1={}'.format(hunter_sha1)
    ]
    if not verbose:
      args += ['--discard', '10']
      args += ['--tail', '200']

    print('Execute command: [')
    for i in args:
      print('  `{}`'.format(i))
    print(']')

    subprocess.check_call(args)

if __name__ == "__main__":
  run()

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

parser = argparse.ArgumentParser(description="Run all tests")

parser.add_argument('--include', nargs='*', type=str)

args = parser.parse_args()

class Log:
  def __init__(self):
    pass
  def p(self, message):
    print('##### {}'.format(message))

log = Log()

log.p('include list: {}'.format(args.include))

top_dir = os.getcwd()
for project in glob.iglob('./tests/*/CMakeLists.txt'):
  if args.include:
    ok = False
    for x in args.include:
      if re.match(x, project):
        log.p('{} included (match {})'.format(project, x))
        ok = True
        break
    if not ok:
      log.p('{} skipped (not match {})'.format(project, args.include))
      continue
  if platform.system() != 'Darwin':
    mac_only = [
        'url_sha1_boost_ios_library',
        'url_sha1_combined_release_debug', # Xcode
        'url_sha1_openssl_ios'
    ]
    skip = False
    for x in mac_only:
      if re.search(x, project):
        log.p('{} skipped (not mac)'.format(project))
        skip = True
    if skip:
      continue

  os.chdir(os.path.dirname(project))
  if os.path.exists('_builds'):
    shutil.rmtree('_builds')
  subprocess.check_call(
      ['cmake', '-H.', '-B_builds', '-DHUNTER_STATUS_DEBUG=ON']
  )

  os.chdir(top_dir)

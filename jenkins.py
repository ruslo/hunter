#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import os
import subprocess
import sys

def run():
  test_dir = os.getenv('TEST_DIR')
  if not test_dir:
    sys.exit('Expected environment variable TEST_DIR')
  test_name = os.getenv('TEST_NAME')
  if not test_name:
    sys.exit('Expected environment variable TEST_NAME')
  os.chdir(os.path.normpath(test_dir))
  args = [
      sys.executable,
      'test.py',
      '--include',
      os.path.normpath(test_name)
  ]
  subprocess.check_call(args)

if __name__ == "__main__":
  run()

#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# https://github.com/ruslo/polly/wiki/Jenkins

import os
import subprocess
import sys

def run_examples(this_dir):
  examples_dir = os.path.join(this_dir, 'examples')
  os.chdir(examples_dir)
  test_examples = os.path.join(examples_dir, 'test.py')
  args = [
      sys.executable,
      test_examples
  ]
  subprocess.check_call(args)
  os.chdir(this_dir)

def run_schemes(this_dir):
  schemes_dir = os.path.join(this_dir, 'cmake', 'schemes')
  os.chdir(schemes_dir)
  test_schemes = os.path.join(schemes_dir, 'test.py')
  args = [
      sys.executable,
      test_schemes
  ]
  subprocess.check_call(args)
  os.chdir(this_dir)

def run():
  this_dir = os.path.dirname(os.path.realpath(__file__))
  run_examples(this_dir)
  run_schemes(this_dir)

if __name__ == "__main__":
  run()

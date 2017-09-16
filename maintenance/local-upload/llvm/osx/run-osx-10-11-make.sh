#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../../.."

# {
export TOOLCHAIN=osx-10-11-make # same as 'libcxx' on Travis
PROJECT_DIR=examples/LLVM ./jenkins.py --verbose --clear-except-download --upload
# }

echo "Done"

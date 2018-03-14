#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# {
export TOOLCHAIN=ios-nocodesign-11-2-dep-9-3-arm64
PROJECT_DIR=examples/OpenCV-extra ./jenkins.py --clear-except-download --upload
# }

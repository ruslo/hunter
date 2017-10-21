#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# {
export TOOLCHAIN=ios-nocodesign-11-0-arm64-dep-9-0-device-libcxx-hid-sections
PROJECT_DIR=examples/OpenCV ./jenkins.py --clear-except-download --upload
# }

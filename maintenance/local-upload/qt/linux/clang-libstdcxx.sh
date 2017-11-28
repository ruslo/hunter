#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }
[ "${ANDROID_NDK_r10e}" = "" ] && { echo "ANDROID_NDK_r10e is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../../.."

# {
export TOOLCHAIN=clang-libstdcxx
PROJECT_DIR=examples/qt-widgets ./jenkins.py --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --nocreate
# PROJECT_DIR=examples/qt-location ./jenkins.py --nocreate # Broken (see .travis.yml)
PROJECT_DIR=examples/qt-qml ./jenkins.py --upload --nocreate
# }

echo "Done"

#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }
[ "${ANDROID_NDK_r10e}" = "" ] && { echo "ANDROID_NDK_r10e is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# First toolchain will run clean
PROJECT_DIR=examples/GTest TOOLCHAIN=default ./jenkins.py --verbose --clear-except-download

# {
export TOOLCHAIN=android-ndk-r10e-api-19-armeabi-v7a-neon
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

# {
export TOOLCHAIN=gcc-4-8
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

# {
export TOOLCHAIN=clang-libstdcxx
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
# PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate # Broken (see .travis.yml)
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

echo "Done"

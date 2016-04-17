#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# First toolchain will run clean
PROJECT_DIR=examples/GTest TOOLCHAIN=default ./jenkins.py --verbose --clear-except

export PROJECT_DIR=examples/qt-widgets

TOOLCHAIN=clang-libstdcxx ./jenkins.py --verbose --upload
TOOLCHAIN=gcc-4-8 ./jenkins.py --verbose --upload
TOOLCHAIN=android-ndk-r10e-api-19-armeabi-v7a-neon ./jenkins.py --verbose --upload

echo "Done"

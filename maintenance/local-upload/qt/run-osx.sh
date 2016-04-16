#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# Xcode 6.1 for Travis
export DEVELOPER_DIR=${IOS_8_1_DEVELOPER_DIR}

export PATH=${DEVELOPER_DIR}/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

which clang
which clang++

# First toolchain will run clean
PROJECT_DIR=examples/GTest TOOLCHAIN=default ./jenkins.py --verbose --clear-except

export PROJECT_DIR=examples/qt-widgets

TOOLCHAIN=osx-10-10-dep-10-9-make ./jenkins.py --verbose --upload # same as 'libcxx' on Travis
TOOLCHAIN=osx-10-9 ./jenkins.py --verbose --upload
TOOLCHAIN=ios-nocodesign-wo-armv7s ./jenkins.py --verbose --upload
TOOLCHAIN=android-ndk-r10e-api-19-armeabi-v7a-neon ./jenkins.py --verbose --upload

echo "Done"

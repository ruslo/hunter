#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }
[ "${ANDROID_NDK_r10e}" = "" ] && { echo "ANDROID_NDK_r10e is not set"; exit 1; }

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

# {
export TOOLCHAIN=osx-10-10-dep-10-9-make # same as 'libcxx' on Travis
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

# {
export TOOLCHAIN=osx-10-9
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

# Xcode 7.3 for iOS 9.3
export DEVELOPER_DIR=${IOS_9_3_DEVELOPER_DIR}
export PATH=${DEVELOPER_DIR}/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

which clang
which clang++

# {
export TOOLCHAIN=ios-nocodesign-9-3-wo-armv7s
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

# {
export TOOLCHAIN=android-ndk-r10e-api-19-armeabi-v7a-neon
PROJECT_DIR=examples/qt-widgets ./jenkins.py --verbose --clear-except-download
PROJECT_DIR=examples/qt-camera ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-location ./jenkins.py --verbose --nocreate
PROJECT_DIR=examples/qt-qml ./jenkins.py --verbose --upload --nocreate
# }

echo "Done"

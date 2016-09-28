#!/bin/bash -e

set -x

[ "${GITHUB_USER_PASSWORD}" = "" ] && { echo "GITHUB_USER_PASSWORD is not set"; exit 1; }

export GITHUB_USER_PASSWORD

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

cd "${THIS_SCRIPT_DIR}/../../.."

# Xcode 7.3 for iOS 9.3
export DEVELOPER_DIR=${IOS_9_3_DEVELOPER_DIR}
export PATH=${DEVELOPER_DIR}/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

which clang
which clang++

# {
export TOOLCHAIN=ios-nocodesign-9-3-wo-armv7s
PROJECT_DIR=examples/OpenCV ./jenkins.py --verbose --upload --clear-except-download
# }

# {
export TOOLCHAIN=ios-nocodesign-9-3
PROJECT_DIR=examples/OpenCV ./jenkins.py --verbose --upload --clear-except-download
# }

# Xcode 6.1 for iOS 8.1
export DEVELOPER_DIR=${IOS_8_1_DEVELOPER_DIR}
export PATH=${DEVELOPER_DIR}/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

which clang
which clang++

# {
export TOOLCHAIN=ios-nocodesign
PROJECT_DIR=examples/OpenCV ./jenkins.py --verbose --upload --clear-except-download
# }

echo "Done"

#!/bin/bash -e

set -x

if [ "`uname`" == "Darwin" ];
then
  brew install python3

  # Patched CMake (for iOS)
  wget https://github.com/ruslo/CMake/releases/download/v3.3.2-p0/cmake-3.3.2-Darwin-x86_64.tar.gz
  tar xf cmake-3.3.2-Darwin-x86_64.tar.gz

  if [[ "${TOOLCHAIN}" == android-* ]];
  then
    wget http://dl.google.com/android/ndk/android-ndk-r10e-darwin-x86_64.bin
    chmod +x android-ndk-r10e-darwin-x86_64.bin
    ./android-ndk-r10e-darwin-x86_64.bin &> /dev/null
  fi
fi

if [ "`uname`" == "Linux" ];
then
  wget --no-check-certificate https://cmake.org/files/v3.4/cmake-3.4.0-Linux-x86_64.tar.gz
  tar xf cmake-3.4.0-Linux-x86_64.tar.gz

  if [[ "${TOOLCHAIN}" == android-* ]];
  then
    wget http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin
    chmod +x android-ndk-r10e-linux-x86_64.bin
    ./android-ndk-r10e-linux-x86_64.bin &> /dev/null
  fi
fi

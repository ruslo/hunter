#!/bin/bash -e

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

[ "$#" == "4" ] || { echo "usage: $0 <build-dir> <lib> <dir> <install-dir>"; exit 1; }

BUILD_DIR="$1"
LIBNAME="$2"
DIRNAME="$3"
INSTALL_DIR="$4"

COMMON_DIR="${BUILD_DIR}/bin.v2/libs/${DIRNAME}/build"

IPHONE_DEBUG=`find "${COMMON_DIR}/darwin-iphoneos/debug" -name "libboost_${LIBNAME}*"`
IPHONE_RELEASE=`find "${COMMON_DIR}/darwin-iphoneos/release" -name "libboost_${LIBNAME}*"`

SIM_DEBUG=`find "${COMMON_DIR}/darwin-iphonesimulator/debug" -name "libboost_${LIBNAME}*"`
SIM_RELEASE=`find "${COMMON_DIR}/darwin-iphonesimulator/release" -name "libboost_${LIBNAME}*"`

echo "IPHONE_DEBUG: $IPHONE_DEBUG"
echo "IPHONE_RELEASE: $IPHONE_RELEASE"
echo "SIM_DEBUG: $SIM_DEBUG"
echo "SIM_RELEASE: $SIM_RELEASE"

DEBUG=`basename ${SIM_DEBUG}`
RELEASE=`basename ${SIM_RELEASE}`

lipo -create "${IPHONE_DEBUG}" "${SIM_DEBUG}" -o "${INSTALL_DIR}/${DEBUG}"
lipo -create "${IPHONE_RELEASE}" "${SIM_RELEASE}" -o "${INSTALL_DIR}/${RELEASE}"

echo "Done: ${INSTALL_DIR}/{${DEBUG}, ${RELEASE}}"

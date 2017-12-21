#!/bin/bash

# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

[ "$#" == "4" ] || { echo "usage: $0 <build-dir> <lib> <dir> <install-dir>"; exit 1; }

BUILD_DIR="$1"
LIBNAME="$2"
DIRNAME="$3"
INSTALL_DIR="$4"

COMMON_DIR="${BUILD_DIR}/bin.v2/libs/${DIRNAME}/build"

IPHONE_DEBUG=`find "${COMMON_DIR}/darwin-gnu-iphoneos/debug" -name "libboost_${LIBNAME}[^_]*.a"`
IPHONE_RELEASE=`find "${COMMON_DIR}/darwin-gnu-iphoneos/release" -name "libboost_${LIBNAME}[^_]*.a"`

SIM_DEBUG=`find "${COMMON_DIR}/darwin-gnu-iphonesimulator/debug" -name "libboost_${LIBNAME}[^_]*.a"`
SIM_RELEASE=`find "${COMMON_DIR}/darwin-gnu-iphonesimulator/release" -name "libboost_${LIBNAME}[^_]*.a"`

echo "-- [iOS universal] IPHONE_DEBUG: $IPHONE_DEBUG"
echo "-- [iOS universal] IPHONE_RELEASE: $IPHONE_RELEASE"
echo "-- [iOS universal] ISIM_DEBUG: $SIM_DEBUG"
echo "-- [iOS universal] ISIM_RELEASE: $SIM_RELEASE"

if [[ -f "${SIM_DEBUG}" ]]
then
  DEBUG=`basename ${SIM_DEBUG}`
else
  DEBUG=`basename ${IPHONE_DEBUG}`
fi

if [[ -f "${SIM_RELEASE}" ]]
then
  RELEASE=`basename ${SIM_RELEASE}`
else
  RELEASE=`basename ${IPHONE_RELEASE}`
fi

function lipo_create {
  iphone=$1
  sim=$2
  dst=$3

  if [[ -f "${iphone}" || -f "${sim}" ]]
  then
    if [[ -f "${iphone}" && -f "${sim}" ]]
    then
      lipo -create "${iphone}" "${sim}" -o "${dst}"
    else
      if [[ -f "${iphone}" ]]
      then
        cp "${iphone}" "${dst}"
      fi
      if [[ -f "${sim}" ]]
      then
        cp "${sim}" "${dst}"
      fi
    fi
  fi

}

lipo_create "${IPHONE_DEBUG}" "${SIM_DEBUG}" "${INSTALL_DIR}/${DEBUG}"
lipo_create "${IPHONE_RELEASE}" "${SIM_RELEASE}" "${INSTALL_DIR}/${RELEASE}"

echo "-- [iOS universal] Done: ${INSTALL_DIR}/{${DEBUG}, ${RELEASE}}"

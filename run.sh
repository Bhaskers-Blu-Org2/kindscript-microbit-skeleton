#!/bin/sh

Y=yotta_modules/yelm-microbit-core
TRG=build/bbc-microbit-classic-gcc/source/yelm-microbit-skeleton-combined.hex
YELM=../yelm

set -x
set -e
mkdir -p build
yotta update
yotta build
node scripts/generateEmbedInfo.js $TRG $Y/generated/metainfo.json
cp build/hexinfo.js $YELM/generated/hexinfo.js
cd $YELM/webapp && jake

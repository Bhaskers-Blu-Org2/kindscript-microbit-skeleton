#!/bin/sh

Y=yotta_modules/kindscript-microbit-core
TRG=build/bbc-microbit-classic-gcc/source/kindscript-microbit-skeleton-combined.hex
KINDSCRIPT=../kindscript

set -x
set -e
mkdir -p build
yotta target bbc-microbit-classic-gcc
yotta update
yotta build
node scripts/generateEmbedInfo.js $TRG $Y/generated/metainfo.json
cp build/hexinfo.js $KINDSCRIPT/generated/hexinfo.js
cd $KINDSCRIPT && jake

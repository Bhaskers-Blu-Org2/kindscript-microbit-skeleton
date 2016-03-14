Y = yotta_modules/kindscript-microbit-core
TRG = build/bbc-microbit-classic-gcc/source/kindscript-microbit-skeleton-combined.hex
KINDSCRIPT = ../kindscript/

-include Makefile.local

all:
	mkdir -p build
	yotta build
	node scripts/generateEmbedInfo.js $(TRG) $(Y)/generated/metainfo.json

run: all
	cp build/hexinfo.js $(KINDSCRIPT)/generated/hexinfo.js
	cd $(KINDSCRIPT)/webapp && jake

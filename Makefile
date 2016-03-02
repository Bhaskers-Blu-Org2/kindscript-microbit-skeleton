Y = yotta_modules/yelm-microbit-core
TRG = build/bbc-microbit-classic-gcc/source/yelm-microbit-skeleton-combined.hex
YELM = ../yelm/

-include Makefile.local

all:
	mkdir -p build
	yotta build
	node scripts/generateEmbedInfo.js $(TRG) $(Y)/generated/metainfo.json

run: all
	cp build/hexinfo.js $(YELM)/generated/hexinfo.js
	cd $(YELM)/webapp && jake

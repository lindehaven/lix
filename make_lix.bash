#!/usr/bin/env bash
OPT='-O2 -Wall -s -o'
BIN='bin/Release/lix.exe'
SRC='src/lix.c'
mkdir -p bin
mkdir -p bin/Release
echo "gcc $OPT $BIN $SRC"
      gcc $OPT $BIN $SRC

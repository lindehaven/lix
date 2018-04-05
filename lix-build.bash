#!/usr/bin/env bash

SRC='lix'
BIN='lix.exe'

SRCDIR='src'
BINDIR='bin/Release'
OBJDIR='obj/Release/src'
CC='gcc'
OPT='-O2 -Wall'
mkdir -p $OBJDIR
mkdir -p $BINDIR
for file in $SRC
do
  objfiles="$objfiles $OBJDIR/$file.o"
  echo "$CC $OPT -c $SRCDIR/$file.c -o $OBJDIR/$file.o"
        $CC $OPT -c $SRCDIR/$file.c -o $OBJDIR/$file.o
done
echo "$CC -o $BINDIR/$BIN -s $objfiles"
      $CC -o $BINDIR/$BIN -s $objfiles

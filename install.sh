#!/bin/bash

PREFIX=~/.local

git clone --depth 1 \
  'https://github.com/dym-sh/new.git' \
  $PREFIX/src/new

ln -s $PREFIX/src/new/new.sh \
      $PREFIX/bin/new

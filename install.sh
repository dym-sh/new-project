#!/bin/bash

# new-project install script

## use
# bash ./install.sh

PREFIX='~/.local'

git clone --depth 1 \
  https://dym.sh/new-project/ \
  $PREFIX/src/new-project

chmod +x $PREFIX/src/new-project/new-project.sh

ln -s $PREFIX/src/new-project/new-project.sh \
      $PREFIX/bin/new-project

#!/bin/zsh

# fast initiation for new projects

PROJECT="$1"

cd `realpath "$0" | xargs dirname`
. config.sh

echo $TEMPLATE

FULL_PATH="$REPOS/$PROJECT"

mkdir -p "$FULL_PATH"
cd "$FULL_PATH/"

git init

git remote add github "git@github.com:$USER/$PROJECT.git"
firefox 'https://github.com/new' &
# if exist – firefox "https://github.com/$USER/$PROJECT/settings"


git remote add gitlab "git@gitlab.com:$USER/$PROJECT.git"
firefox 'https://gitlab.com/projects/new' &
# if exist – firefox "https://gitlab.com/$USER/$PROJECT/edit"

git remote add production "git@$PRODUCTION:~/$PROJECT.git"

[ ! -e 'license' ] \
  && cp "$REPOS/license" .

[ ! -e 'readme.md' ] \
	&& touch 'readme.md'

echo "$TEMPLATE" >> 'readme.md'


git add 'readme.md'
git add 'license'
git commit -am 'init'

sublime_text "$FULL_PATH/"

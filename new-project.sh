#!/usr/bin/zsh

# fast initiation for new projects

PROJECT="$1"
PROJECT_TYPE="$2"

# make sure we cd into real dir and not that of a symlink, just to include config file
cd `realpath "$0" | xargs dirname`
. './config.sh'


# create project directory
FULL_PATH="$REPOS/$PROJECT"
mkdir -p "$FULL_PATH"
cd "$FULL_PATH/"


# create new hyperdrive
hyp create drive \
  | grep -oE 'hyper://\w+' \
  > '.hyper'

# start seeding hyperdrive on the server
ssh "$HYPERCORE_SERVER" "hyp seed `cat '.hyper'`"


# add new name to the entire list of projects
echo "- [$PROJECT](./$PROJECT)" \
  >> "$REPOS/readme.md"

# create license file if none present
[ ! -e 'license' ] \
  && echo "$LICENSE" > 'license'

# add template to the readme
if [ 'pic' == "$PROJECT_TYPE" ]; then
  echo "$README_PIC" >> 'readme.md'
elif [ 'web' == "$PROJECT_TYPE" ]; then
  echo "$README_WEB" >> 'readme.md'
else
  echo "$README_..." >> 'readme.md'
fi


# add git mirrors and create repos for them
git init

git remote add github "git@github.com:$USER/$PROJECT.git"
firefox 'https://github.com/new' &
# if exist – firefox "https://github.com/$USER/$PROJECT/settings"

git remote add gitlab "git@gitlab.com:$USER/$PROJECT.git"
firefox 'https://gitlab.com/projects/new' &
# if exist – firefox "https://gitlab.com/$USER/$PROJECT/edit"

git remote add production "git@$PRODUCTION:~/$PROJECT.git"


# initial commit
git add 'readme.md'
git add 'license'
git add '.hyper'
git commit -am 'init'


# start coding
sublime_text "$FULL_PATH/"

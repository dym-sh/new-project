#!/bin/bash

# pick project type for templates
PROJECT_TYPE=''
while (( "$#" )); do
  case "$1" in
    -c|--code)
      PROJECT_TYPE='code'
      shift
      ;;
    -g|--graphics)
      PROJECT_TYPE='graphics'
      shift
      ;;
    -n|--note)
      PROJECT_TYPE='note'
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag '$1'"
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
echo "PROJECT_TYPE: '$PROJECT_TYPE'"

# full name of the project
PROJECT=`echo "$PARAMS" | xargs` # trim()
echo "PROJECT: '$PROJECT'"

# make slug
SLUG=`echo "$PROJECT" \
  | sed -e 's/[\W_]\+/-/g' \
  | sed -e 's/^\-\+//g' \
  | sed -e 's/\-\+$//g' \
  | tr '[:upper:]' '[:lower:]' \
  `
echo "SLUG: '$SLUG'"


# make sure we cd into real dir and not that of a symlink, just to include config file
cd `realpath "$0" | xargs dirname`
. './config.sh'

# create project directory
FULL_PATH="$PROJECTS_DIR/$SLUG"
mkdir -p "$FULL_PATH"

# some general dates to be used in templates
YEAR=`date '+%Y'`
TODAY=`date '+%Y-%m-%d'`

# include templates
. "./templates/$PROJECT_TYPE.sh"

cd "$FULL_PATH/"

# add template to the readme
echo "$README" >> 'readme.md'

# create license file if none present
[ ! -e 'license' ] \
  && echo "$LICENSE" > 'license'

# populate meta.toml
echo "$META_TOML" >> 'meta.toml'


# add git mirrors and create repos for them
git init

git remote add github "git@github.com:$USER/$SLUG.git"
firefox 'https://github.com/new' &
# #TODO: if exist – firefox "https://github.com/$USER/$SLUG/settings"

git remote add gitlab "git@gitlab.com:$USER/$SLUG.git"
firefox 'https://gitlab.com/projects/new' &
# #TODO: if exist – firefox "https://gitlab.com/$USER/$SLUG/edit"

git remote add production "$DEPLOY_GIT:$SLUG.git"


# add created files
git add 'readme.md'
git add 'meta.toml'
git add 'license'


# start coding
$EDITOR "$FULL_PATH/"

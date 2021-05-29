#!/usr/bin/zsh

# fast initiation for new projects

# -c=code -g=graphics
PROJECT_TYPE='code'

echo "
@: '$@'
#: '$#'
"

while (( "$#" )); do
  case "$1" in
    -c)
      PROJECT_TYPE='code'
      echo "PROJECT_TYPE: '$PROJECT_TYPE' (code)"
      shift
      ;;
    -g)
      PROJECT_TYPE='graphics'
      echo "PROJECT_TYPE: '$PROJECT_TYPE' (graphics)"
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1"
      ;;
    *) # preserve positional arguments
      echo 'PARAMS="$PARAMS $1"'
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

echo "$PROJECT_TYPE"

# name of the project
PROJECT="$1"



# make sure we cd into real dir and not that of a symlink, just to include config file
cd `realpath "$0" | xargs dirname`
. './config.sh'

# create project directory
FULL_PATH="$REPOS/$PROJECT"
mkdir -p "$FULL_PATH"

# include templates
. './templates.sh'


cd "$FULL_PATH/"

# add template to the readme
# and create license file if none present
if [[ 'graphics' == "$PROJECT_TYPE" ]]; then
  echo "$README_GRAPHICS" >> 'readme.md'
  [ ! -e 'license' ] \
    && echo "$LICENSE_GRAPHICS" > 'license'

elif [[ 'code' == "$PROJECT_TYPE" ]]; then
  echo "$README_CODE" >> 'readme.md'
  [ ! -e 'license' ] \
    && echo "$LICENSE_CODE" > 'license'

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

git remote add production "$DEPLOY:~/$PROJECT.git"


# initial commit
git add 'readme.md'
git add 'license'
git commit -am 'init'


# start coding
sublime_text "$FULL_PATH/"

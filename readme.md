# new-project

> fast initiation for new projects


## flow

1. appends header, preview, mirrors, and license to the readme
2. creates license if none present
3. creates initial commit out of readme and license
4. adds git-origins
5. opens github and gitlab websites to create repos
6. opens directory in text editor


## [install](./install.sh)
``` sh
PREFIX='~/.local'

git clone --depth 1 \
  https://dym.sh/new-project/ \
  $PREFIX/src/new-project

chmod +x $PREFIX/src/new-project/new-project.sh

ln -s $PREFIX/src/new-project/new-project.sh \
      $PREFIX/bin/new-project
```


## use
1. adjust [`config.sh`](./config.sh) to your preferences
2. `new-project test-1`


## todo
- automatically create beaker/hyper drive and add it to mirror-urls
- check if mirrors already have that name and open settings instead of repo-creation


## mirrors
- https://github.com/dym-sh/new-project
- https://gitlab.com/dym-sh/new-project
- https://dym.sh/new-project


## license
[mit](./license)

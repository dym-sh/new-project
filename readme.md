# new

> fast initiation for new projects


## flow of creation
1. appends header, preview, and cross-post links to the readme
1. creates license if none present
1. adds homepage, mirrors, license, etc.. to the [`meta.toml`](https://github.com/dym-sh/meta-toml)
1. adds git-origins for code mirroring
1. opens github and gitlab websites to create new repos
1. opens created files in text `$EDITOR` (if it supports opening directories)


## install and use
1. look at [`install.sh`](./install.sh) file for instructions
1. adjust `PREFIX` at wish
1. make sure the final directory is on `$PATH`
1. tinker with [`config.sh`](./config.sh) until it works
1. see the info: `new --help`
1. test: `new test 1+2=3 --code`
1. make sure the permissive licenses used in templates are something you'd be content with releasing your content under, otherwise change them accordingly


## todo
- `--code`: check if mirrors already have same project name and open settings instead of repo-creation
- `--comic`: 4 frames, with visual descriptions for each
- `--article`: long multipart note?
- `--TBD`: whatever else comes along
- optionally predefine `--slug=string-with-dashes-different-from-project-name-with-replaced-non-words`
- check if project with same slug already exist, and ask for actions
- `-l pd | --license=PublicDomain`: define custom licenses

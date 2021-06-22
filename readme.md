# new

> fast initiation for new projects


## flow
1. appends header, preview, mirrors, and license to the readme
1. creates license if none present
1. creates initial commit out of readme and license
1. adds git-origins
1. opens github and gitlab websites to create repos
1. opens directory in text editor


## install and use
1. look at [install](./install.sh) file for instructions
1. adjust `PREFIX` at wish
1. make sure the final directory is on `$PATH`
1. tinker with [`config.sh`](./config.sh) until it works
1. test: `new test-001 --code`


## todo
- `--code`: check if mirrors already have same project name and open settings instead of repo-creation
- `--comic`: 4 frames, with visual descriptions for each
- `--article`: long multipart note?
- `--TBD`: whatever else comes along
- optional `--slug=string-with-dashes`


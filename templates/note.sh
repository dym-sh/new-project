# template strings for note

README="# $PROJECT

> <DESCRIPTION>

## Part 1
- ___
- ___
"

META_TOML="title = '$PROJECT'"

[[ "$PROJECT" != "$SLUG" ]] \
  && META_TOML="$META_TOML
slug = '$SLUG'"

META_TOML="$META_TOML
description = '<DESCRIPTION>'
type = 'note'
tags = [ 'tag-1', 'tag-2' ]
license = 'CC-BY'
homepage = '$BASE_URL/$SLUG'

[data]
raw = './readme.md'

[cross-posts]
reddit = 'https://reddit.com/r/$USER_/___'
twitter = 'https://twitter.com/$USER_/status/___'

[log]
created = $TODAY
"


LICENSE="Creative Commons Attribution 4.0 International
<https://creativecommons.org/licenses/by/4.0/>

Creator: $FULLNAME, $YEAR

You are free to:
- Share — copy and redistribute the material in any medium or format.
- Adapt — remix, transform, and build upon the material for any purpose, even commercially.


The licensor cannot revoke these freedoms as long as you follow the license terms:
- Attribution — You must give appropriate credit, provide a link to the license,
  and indicate if changes were made. You may do so in any reasonable manner,
  but not in any way that suggests the licensor endorses you or your use.

- No additional restrictions — You may not apply legal terms or technological measures
  that legally restrict others from doing anything the license permits.


## Notices
You do not have to comply with the license for elements of the material
in the public domain or where your use is permitted by an applicable exception or limitation.

No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy,
or moral rights may limit how you use the material.
"

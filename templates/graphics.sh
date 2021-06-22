# template strings for graphics

README="# $PROJECT

> <DESCRIPTION>

![](./01.png)


## visual description

<VISUAL_DESCRIPTION>
"

META_TOML="title = '$PROJECT'
slug = '$SLUG'
description = '<DESCRIPTION>'
type = 'graphics'
tags = [ 'tag-1', 'tag-2' ]
license = 'CC-BY'
homepage = '$BASE_URL/$SLUG'
icon = './icon.png'
preview = './preview.png'

[source]
url = 'https://figma.com/file/___'
local = './src/$SLUG.fig'

[out]
final = './out/$SLUG.png'


[[references]]
type = 'inspiration'
description = '<DESCRIPTION for REF-1>'
url = 'https://___'

[[references]]
type = 'original'
description = '<DESCRIPTION for REF-2>'
url = 'https://___'


[cross-posts]
reddit = 'https://reddit.com/r/$USER_/___'
twitter = 'https://twitter.com/$USER_/status/___'
instagram = 'https://instagram.com/p/___'
behance = 'https://behance.net/___'
pixiv = 'https://pixiv.net/en/artworks/___'

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

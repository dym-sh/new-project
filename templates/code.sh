# code
README="# $PROJECT

> <DESCRIPTION>


<a href='./preview.png'><img height=100 border=2 align='right' alt='preview' src='./preview.png'></a>
## preview
- [preview.html](./preview.html)
- https://codepen.io/$USER/pen/___/left/?editors=0100
"


META_TOML="title = '$PROJECT'"

[[ "$PROJECT" != "$SLUG" ]] \
  && META_TOML="$META_TOML
slug = '$SLUG'"

META_TOML="$META_TOML
description = '<DESCRIPTION>'
type = 'code'
tags = [ 'tag-1', 'tag-2' ]
license = 'MIT'
homepage = '$BASE_URL/$SLUG'
source = '$DEPLOY_WEB/$SLUG'

[mirrors]
github = 'https://github.com/$USER/$SLUG'
gitlab = 'https://gitlab.com/$USER/$SLUG'
codepen = 'https://codepen.io/$USER/pen/___/left/?editors=0100'
npm = 'https://npmjs.com/package/$SLUG'

[log]
created = $TODAY
"


LICENSE="MIT License

Copyright (c) $YEAR $FULLNAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"

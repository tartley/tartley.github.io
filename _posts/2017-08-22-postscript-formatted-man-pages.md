---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Linux-dev, Bash]
comments: []
date: 2017-08-22 20:34:02 -0500
date_gmt: 2017-08-22 19:34:02 -0500
layout: post
published: true
status: publish
tags: []
title: Postscript formatted man pages
wordpress_id: 1683
wordpress_url: http://tartley.com/?p=1683
...
---

`man` and its `troff` formatting can be asked to produce postscript
output. Define a Bash function, e.g. in your .bashrc:

``` {lang="bash" escaped="true"}
function psman () {
    SLUG=$(echo $@ | tr ' ' '-')
    FNAME="/tmp/man-$SLUG.pdf"
    set -o pipefail
    man -t "$@" | ps2pdf - "$FNAME" && \
      nohup evince "$FNAME" >/dev/null 2>/dev/null
    set +o pipefail
}
```

(I tried to do this without tempfiles, using process substitution, [but
failed. Anyone got better
Bash-fu](https://superuser.com/questions/1243405)?)

The `man -t` is the crucial part. It tells `man` to produce output in
postscript format, which `ps2pdf` can read, and `evince` displays the
PDF. We disconnect the evince process using `nohup`, so that it lives on
even if we kill the terminal. We \`set -o pipefail\` so that if \`man\`
fails, the exit code is preserved as the exit of \`man|ps2pdf\`, which
causes the \`&&\` to short-circuit, preventing evince from being run on
an empty pdf document. We restore \`+o pipefail\` again at the end.

Then, from the command line:

``` {lang="bash"}
$ psman tr
```

produces

[![](http://tartley.com/wp-content/uploads/2017/08/pman-tr.png){.alignnone
.wp-image-1684 .size-full width="973"
height="491"}](http://tartley.com/wp-content/uploads/2017/08/pman-tr.png)

 

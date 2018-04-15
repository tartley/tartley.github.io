---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [MSWin-dev]
comments:
- {author: Stu, author_email: stu.axon@gmail.com, author_url: 'http://stuartaxon.com',
  content: "I've been wanting this since forever (OK, since I switched to windows\
    \ 2000), thanks !\r\n\r\n\r\nI'm also quite into using colour in my prompts and\
    \ did a post about it:\r\n\r\nhttp://www.stuartaxon.com/2008/08/21/making-windows-usable-colourisation/",
  date: '2010-11-15 22:22:47 -0600', date_gmt: '2010-11-15 22:22:47 -0600', id: 34791}
date: 2010-07-08 14:07:09 -0500
date_gmt: 2010-07-08 13:07:09 -0500
layout: post
published: true
status: publish
tags: []
title: 'More Colored Terminal text on Windows: AnsiCon'
wordpress_id: 1108
wordpress_url: http://tartley.com/?p=1108
---

A reminder for myself:

ANSI escape characters don't work properly in Windows terminals:

![Before: Raw ANSI codes. Not nice.](/assets/2010/07/ansicon00-before.png)

To make them work properly, use
[AnsiCon](http://adoxa.110mb.com/ansicon/index.html). Unzip it somewhere
permanent (eg. `%ProgramFiles%\ansicon`) and install it with:

```
ansicon.exe -i
```

start a new terminal, and lo:

![After: Pretty.](/assets/2010/07/ansicon01-working.png)

Fine tune the appearance of the programs generating the color, for
example customise 'hg diff' by editing \~/.hgrc:

```
[extensions]
color =

[color]
status.modified = yellow bold
status.unknown = white
status.deleted = red_background white bold

diff.deleted = red bold
diff.inserted = green bold
diff.file_a = white
diff.file_b = white
diff.diffline = white_background black
diff.extended = yellow bold
diff.hunk = underline black
diff.changed = yellow bold
```

![Fine-tuned](/assets/2010/07/ansicon02-tuned.png)

ANSI is correctly stripped out if the output of a program is not a
terminal, so the colored output won't interfere with saving to files nor
machine-parsing of the text:

![Filtered](/assets/2010/07/ansicon03-filtered.png)

Finally, insert some [ANSI
codes](http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html)
into your [prompt](http://ss64.com/nt/prompt.html), by setting
environment variable PROMPT:

```
set PROMPT=$E[0;36m$P$_$E[36;1m$G$E[0m$S
```

![Colored Prompt](/assets/2010/07/ansicon04-prompt.png)

[Multiple](http://tartley.com/?p=1062)
[posts](http://tartley.com/?p=863) on colors and terminal text is
perhaps a bit obsessive of me. I think I'm all done now.

---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, MSWin-dev]
comments:
- {author: john speno, author_email: spamfilter@macspeno.com, author_url: '', content: looks
    beautiful and I appreciate the effort you put into this!, date: '2010-04-21 15:23:41
    -0500', date_gmt: '2010-04-21 14:23:41 -0500', id: 27612}
- {author: Juho Veps&Atilde;&curren;l&Atilde;&curren;inen, author_email: bebraw@gmail.com,
  author_url: 'http://nixtu.blogspot.com/', content: 'Thanks a lot man! I just managed
    to add some color to my little terminal project. :)', date: '2010-04-21 16:29:49
    -0500', date_gmt: '2010-04-21 15:29:49 -0500', id: 27613}
- {author: Lennart Regebro, author_email: regebro@gmail.com, author_url: '', content: "Cool!\r\
    \n\r\nI think it's a problem that \"normal\" are illegible on Unix and legible\
    \ on Windows, while \"dim\" and \"bright\" is legible on Unix and illegible on\
    \ Windows.The problem is based on that you map \"dim\" to \"normal\" and \"normal\"\
    \ to \"bright\".\r\n\r\nI think it would be better to just map dim -> normal,\
    \ and note that there is no dim setting on Windows, so don't use it. :)", date: '2010-04-21
    19:57:12 -0500', date_gmt: '2010-04-21 18:57:12 -0500', id: 27618}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks heaps for the encouragement Juho and John.\r\n\r\nThanks also to\
    \ Lennart. I really want to chat to people about this mapping, so your thoughts\
    \ are very much wanted. But thus far I think we're both just a bit confused. :-)\r\
    \n\r\nThe illegible settings you describe only apply when printing black text\
    \ on a black background (top left of the grids above.) When printing white text\
    \ on a black background (top right of grids), all is visible on both UNIX and\
    \ Windows.\r\n\r\nCurrently my mapping is:\r\n\r\nANSI dim -> Win dim fore on\
    \ dim back\r\nANSI normal -> Win bright fore on dim back\r\nANSI bright -> Win\
    \ bright fore on bright back\r\n\r\nHowever, using bright backgrounds might look\
    \ messy on applications that don't expect the background brightness to change,\
    \ so I'm considering doing what you say anyway.\r\n\r\nThe problem is that there\
    \ are two possibilities, both of which are also flawed:\r\n\r\nANSI dim -> (same\
    \ as 'ANSI normal')\r\nANSI normal -> Win dim fore on dim back\r\nANSI bright\
    \ -> Win bright fore on dim back\r\n(ie. no longer support 'dim', and ANSI normal\
    \ comes out as dim text, which is probably rubbish)\r\n\r\nor\r\n\r\nANSI dim\
    \ -> Win dim fore on dim back\r\nANSI normal -> Win bright fore on dim back\r\n\
    ANSI bright -> (same as 'ANSI normal')\r\n(ie. no longer support 'ANSI bright')\r\
    \n\r\nI guess I'd choose the latter. Or maybe I could let it be configurable?",
  date: '2010-04-21 23:02:17 -0500', date_gmt: '2010-04-21 22:02:17 -0500', id: 27625}
- {author: 'tartley.com : More Colored Terminal text on Windows: AnsiCon', author_email: '',
  author_url: 'http://tartley.com/?p=1108', content: '[...] Multiple posts on colored
    terminal text is perhaps a bit obsessive. I think I&#039;m all done now.   Posted
    by tartley on Thursday, July 8, 2010, at 14:07. Filed under MSWin-dev. Follow
    any responses to this post with its comments RSS feed. You can post a comment
    or trackback from your blog. [...]', date: '2010-07-08 14:22:12 -0500', date_gmt: '2010-07-08
    13:22:12 -0500', id: 29649}
date: 2010-04-21 10:18:30 -0500
date_gmt: 2010-04-21 09:18:30 -0500
layout: post
published: true
status: publish
tags: []
title: 'colorama: Simple cross-platform Python API for colored terminal text'
wordpress_id: 1062
wordpress_url: http://tartley.com/?p=1062
---

Announcing new Python package, colorama:[\
http://pypi.python.org/pypi/colorama](http://pypi.python.org/pypi/colorama)

ANSI escape character sequences have long been used to produce colored
terminal text on Unix and Macs. Colorama makes this work on Windows,
too. It also provides some shortcuts to help generate these ANSI
sequences, and works fine in conjunction with any other ANSI sequence
generation library, such as Termcolor
(<http://pypi.python.org/pypi/termcolor>.)

This has the upshot of providing a simple cross-platform API for
printing colored terminal text from Python, and has the happy
side-effect that existing applications or libraries which use ANSI
sequences to produce colored output on Linux or Macs can now also work
on Windows, simply by calling `colorama.init()`.

I realise that printing colored terminal text is verging on
pathalogically superficial, but it has long irked me that this didn't
just work. Python should make this easy.

My mapping of ANSI conventions to the equivalent Win32 calls is far from
perfect. Currently it has the following results. ANSI codes under Ubuntu
on gnome-terminal:

![](/assets/2010/04/screenshot-ubuntu-gnometerminal.png)

and the exact same ANSI codes printed on Windows under Colorama:

![](/assets/2010/04/screenshot-winxp-console2.png)

**Update:** I previously wrote here about discrepancies between the two,
which have since been fixed. The only outstanding issue is that colorama
does not support 'dim' text on Windows - it looks just the same as
'normal' text, and as far as I know, will never be able to.

<http://pypi.python.org/pypi/colorama>

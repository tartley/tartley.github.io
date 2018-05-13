---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing, Software, MSWin-dev]
comments:
- {author: 'tartley.com : Testwatcher', author_email: '', author_url: 'http://tartley.com/?p=755',
  content: '[...] This idea may have now reached a viable fruition, documented here.   Posted
    by tartley on Wednesday, April 29, 2009, at 23:02. Filed under Python, Testing.
    Follow [...]', date: '2010-10-15 01:49:01 -0500', date_gmt: '2010-10-15 00:49:01
    -0500', id: 33520}
- {author: Juho Veps&Atilde;&curren;l&Atilde;&curren;inen, author_email: bebraw@gmail.com,
  author_url: 'http://nixtu.blogspot.com', content: "Great idea! Thanks for sharing.\
    \ :)\r\n\r\nThis is like \"--looponfail\" option on py.test except way cooler.\
    \ :)", date: '2010-10-15 07:15:50 -0500', date_gmt: '2010-10-15 06:15:50 -0500',
  id: 33530}
- {author: Jonathan Ballet, author_email: jon@multani.info, author_url: '', content: "Under\
    \ Linux (and MacOSX too I guess), you can use the \"watch\" command to keep your\
    \ tests running while you code.\r\nI often have my screen split in half, my text\
    \ editor on one side, and my terminal running \"watch -n 1 ./bin/test\" on the\
    \ other side, very useful.", date: '2010-10-15 12:53:33 -0500', date_gmt: '2010-10-15
    11:53:33 -0500', id: 33537}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@Jonathan Ballet: Hey. Yeah, 'watch' is a great tool, in many situations\
    \ it's exactly what you need. That's why I mentioned it in the original post!\
    \ :-)\r\n\r\nThis replacement is intended for those times I'm developing on Windows,\
    \ and also I don't want to actually re-run the tests unless something's actually\
    \ changed. Polling the file stats seems to be much cheaper, so it allows for more\
    \ rapid polling without eating all the CPU.", date: '2010-10-15 14:28:46 -0500',
  date_gmt: '2010-10-15 13:28:46 -0500', id: 33541}
- {author: Thomas Smith, author_email: tgs@resc.net, author_url: '', content: "When\
    \ you're on Linux, you have the lovely inotify.  I installed inotify-tools, and\
    \ now I have this shell script:\r\n\r\n#!/bin/bash\r\nset -x\r\n\r\nwhile true;\
    \ do\r\n\tnose whatever blah\r\n\tinotifywait -e modify *.py\r\ndone", date: '2010-10-15
    16:46:42 -0500', date_gmt: '2010-10-15 15:46:42 -0500', id: 33553}
- {author: Danny Navarro, author_email: j@dannynavarro.net, author_url: 'http://blog.dannynavarro.net',
  content: 'In Linux you can use incron to launch jobs upon new files or file modifications
    <a href="http://www.debian-administration.org/articles/581" rel="nofollow">incron</a>',
  date: '2010-10-15 17:52:15 -0500', date_gmt: '2010-10-15 16:52:15 -0500', id: 33554}
- {author: Paul Hildebrandt, author_email: paul_hildebrandt@yahoo.com, author_url: '',
  content: "Have you checked out Nosyd?\r\n\r\nhttp://pypi.python.org/pypi/Nosyd/0.0.5",
  date: '2010-10-16 01:41:45 -0500', date_gmt: '2010-10-16 00:41:45 -0500', id: 33569}
- {author: Ben Finney, author_email: bignose@example.org, author_url: '', content: "I've\
    \ been using the <a href=\"http://inotify.aiken.cz/\" rel=\"nofollow\">inotify</a>\
    \ tools in a loop to do the same thing.\r\n\r\nwhile true ; do clear ; printf\
    \ \"Test run at %s\\n\" \"$(date +'%F %T')\" ; python ./setup.py test ; inotifywait\
    \ -e create -e modify -e delete -t -r . ; done", date: '2010-10-16 01:48:12 -0500',
  date_gmt: '2010-10-16 00:48:12 -0500', id: 33570}
- {author: rohan, author_email: rohan.deshpande@gmail.com, author_url: '', content: "Not\
    \ sure if it's much help, but autospec/autotest do a similar thing in Ruby that\
    \ might be worth looking into for ideas :)\r\n\r\nhttp://www.zenspider.com/ZSS/Products/ZenTest/",
  date: '2010-10-16 23:11:24 -0500', date_gmt: '2010-10-16 22:11:24 -0500', id: 33602}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Sounds like there''s a few things there I should be reading about. Thanks
    heaps for the pointers, people.', date: '2010-10-18 18:55:24 -0500', date_gmt: '2010-10-18
    17:55:24 -0500', id: 33657}
date: 2010-10-15 01:43:33 -0500
date_gmt: 2010-10-15 00:43:33 -0500
layout: post
published: true
status: publish
tags: []
title: Rerun unit tests whenever files update
wordpress_id: 1247
wordpress_url: http://tartley.com/?p=1247
---

*In which I once again indulge my obscure command-line fetish.*

I often spend hours of my day cycling through:

-   Edit code and its unit tests
-   Save my changes
-   Push a button or change window focus to explicitly re-run the code's
    unit tests.

Oh frabjous day, the grinding manual labour of the last of these three
steps can now be banished forever, courtesy of `rerun`, a command line
Python script that re-runs a given command whenever it detects changes
to any of the files in the current directory, or its subdirectories.

**Update**: It's Python 2.7, and works great on Windows XP, Macs and
Ubuntu.

For example: I had previously bound f6 in Vim to 'run the current file's
unit tests. Now I've bound shift-f6 to `rerun` the current file's
unit tests in a new console window. This pops up a new window showing
the test results. I then continue editing in Vim, and whenever I hit
save, the unit tests are re-run in the other window. All the while the
focus stays on my editor. It's really sweet!

Thanks for the original idea goes to to the bash command `watch`, and an
old (now offline) blog post by Jeff Winkler.

<https://bitbucket.org/tartley/rerun>
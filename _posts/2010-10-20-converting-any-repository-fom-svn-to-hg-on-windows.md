---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek]
comments:
- {author: Michael Foord, author_email: michael@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/',
  content: "Muppet. :-)\r\n\r\nThat technique works for the Mac too. You lose your\
    \ repo history though, which was kinda the *entire* point of my post...", date: '2010-10-20
    11:54:22 -0500', date_gmt: '2010-10-20 10:54:22 -0500', id: 33712}
- {author: Michael Foord, author_email: michael@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/',
  content: 'Oh, and the title of this entry says *fom* rather than *from*.', date: '2010-10-20
    11:54:53 -0500', date_gmt: '2010-10-20 10:54:53 -0500', id: 33713}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Nuances! You are such a pedant!, date: '2010-10-20 14:01:36 -0500', date_gmt: '2010-10-20
    13:01:36 -0500', id: 33715}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: 'When
    you''re as old as tartley, it''s always Year Zero.', date: '2010-10-20 15:05:56
    -0500', date_gmt: '2010-10-20 14:05:56 -0500', id: 33716}
- {author: Danger, author_email: danger@mailinator.com, author_url: '', content: "Danger\
    \ danger! If you have spaces in the wrong place you'll wipe too much.\r\n\r\n\
    Correct ways:\r\n\r\nfind . -name .svn -exec rm -fr {} \\;\r\n\r\nfind . -name\
    \ .svn -print0 | xargs -0 rm -fr", date: '2010-12-20 11:16:51 -0600', date_gmt: '2010-12-20
    11:16:51 -0600', id: 36196}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I see what you mean. Good correction, Danger, thanks! I''ll correct the
    post when I''m at a real keyboard.', date: '2010-12-21 10:44:59 -0600', date_gmt: '2010-12-21
    10:44:59 -0600', id: 36288}
date: 2010-10-20 10:26:02 -0500
date_gmt: 2010-10-20 09:26:02 -0500
layout: post
published: true
status: publish
tags: []
title: Converting any repository from Svn to Hg on Windows
wordpress_id: 1252
wordpress_url: http://tartley.com/?p=1252
...
---

There's been a lot of
[blather](http://www.voidspace.org.uk/python/weblog/index.shtml) of late
about this supposedly-fiddly conversion process. Personally I've found
that working on the Windows operating system, the transition is a lot
smoother. Simply first install Cygwin, cd to the root of your
repository, and then:

``` {lang="bash"}
find . -name .svn -exec rm -fr {} \;
hg init
hg add .
```

and you're done. There may be a few *nuances* this doesn't address, but
come on, let's not expect miracles.

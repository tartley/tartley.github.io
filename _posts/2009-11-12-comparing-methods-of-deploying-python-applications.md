---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Richard Jones, author_email: r1chardj0n3s@gmail.com, author_url: '', content: Bring
    on Bootstrap!!!, date: '2009-11-13 00:35:30 -0600', date_gmt: '2009-11-13 00:35:30
    -0600', id: 24327}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Yah, bootstrap seems like the best solution - but obviously it's not trivial.\
    \ It would have to test if any of the currently installed interpreters are of\
    \ a suitable version, and if not, download and install one, side by side with\
    \ existing ones, and make sure your program gets run with that version, but all\
    \ other python programs remain unaffected.\r\n\r\nI know on Windows there's a\
    \ list of installed interpreters in the registry. Is there an equivalent on other\
    \ platforms?", date: '2009-11-13 09:17:57 -0600', date_gmt: '2009-11-13 09:17:57
    -0600', id: 24333}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Actually, come to think of it, now that I describe what ''bootstrap''
    would have to do, it seems like it''s crying out for a robust version of ''pychoose''
    that I created the other day. I didn''t realise these two itches of mine were
    so intimately overlapping.', date: '2009-11-13 09:19:47 -0600', date_gmt: '2009-11-13
    09:19:47 -0600', id: 24334}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Perhaps if I create a dead simple version of Bootstrap, which doesn''t
    worry about what version of Python your script needs, then maybe I could interest
    people in trying to help me improve it. Hmmm.', date: '2009-11-13 09:20:39 -0600',
  date_gmt: '2009-11-13 09:20:39 -0600', id: 24335}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hmm. That's not going to work, exactly as stated. At the very least, each\
    \ application would need to maintain it's own virtualenv, to avoid clobbering\
    \ versions of libraries needed by other applications.\r\n\r\nTo do it right is\
    \ going to be a bunch of work.", date: '2009-11-13 09:44:19 -0600', date_gmt: '2009-11-13
    09:44:19 -0600', id: 24336}
date: 2009-11-12 12:18:19 -0600
date_gmt: 2009-11-12 12:18:19 -0600
layout: post
published: true
status: publish
tags: []
title: Comparing methods of deploying Python applications
wordpress_id: 878
wordpress_url: http://tartley.com/?p=878
...
---

I had [a cry](http://tartley.com/?p=843) last month about deploying a
Python application to end-users being more fiddly and difficult than I
expected it to be. I'm talking about py2exe, Freeze, and their ilk.

As a quick follow-up, I recently [posted to
comp.lang.python](http://groups.google.com/group/comp.lang.python/browse_thread/thread/5abb44388a28ce25/8ce490b3587719e4?lnk=gst&q=directory+python+installed&pli=1)
about a spreadsheet I've made, comparing comparing the solutions I've
found thus far:

<http://spreadsheets.google.com/pub?key=tZ42hjaRunvkObFq0bKxVdg&output=html>

Each column represents a method of distributing a Python application to
an end-user without them having to worry about what Python is or whether
they have an appropriate version of it installed. 'Bundle' represents
manually bundling an interpreter with your application. 'Bootstrap'
represents a sort of fanciful vision of manually creating a compiled
installer which downloads and installs an interpreter if required,
before running your Python application on it. The other columns
represent the various splendid projects like py2exe which perform the
bundling process for you.

Each row represents a reason to choose between them. By my criteria,
which are no doubt idiosyncratic, cx\_freeze or maybe PyInstaller are
starting to look like good contenders for future projects.

Obviously feedback about any wrong-headedness on my part is appreciated.

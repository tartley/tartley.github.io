---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics]
comments:
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: Totally
    works on my Windows! Sweet!, date: '2008-06-18 13:21:23 -0500', date_gmt: '2008-06-18
    13:21:23 -0500', id: 15194}
- {author: Menno Smits, author_email: menno@freshfoo.com, author_url: 'http://freshfoo.com/',
  content: "Neat! Works out of the box on Fedora Core 8.\r\nLooking forward to the\
    \ next release.", date: '2008-06-18 21:29:06 -0500', date_gmt: '2008-06-18 21:29:06
    -0500', id: 15211}
- {author: Michael Foord, author_email: fuzzyman@gmail.com, author_url: 'http://www.ironpythoninaction.com/',
  content: Very nice! Might be worth mentioning that it requires Python 2.5 (or the
    ctypes module - a requirement of Pyglet)., date: '2008-06-19 09:46:09 -0500',
  date_gmt: '2008-06-19 09:46:09 -0500', id: 15226}
- {author: chinaman, author_email: pypehughrhisy1@mail.ru, author_url: 'http://www.elcocn.com/',
  content: "Hi \r\nWhere did you get words for this paper? From your head???", date: '2008-09-18
    01:28:08 -0500', date_gmt: '2008-09-18 01:28:08 -0500', id: 17703}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hello chinaman. Anyone taking bets that he turns out to be an... um...
    is there a word yet for an innocuous-looking post placed so that the author can
    come back after it is approved and replace the contents with spam?', date: '2008-09-18
    14:02:48 -0500', date_gmt: '2008-09-18 14:02:48 -0500', id: 17716}
date: 2008-06-18 06:37:17 -0500
date_gmt: 2008-06-18 06:37:17 -0500
layout: post
published: true
status: publish
tags: [game, Python, 2d, rigid body, physics, Graphics, chipmunk, pymunk, pyglet]
title: 'Sole Scion project v0.1 : A 2D rigid-body Python game'
wordpress_id: 349
wordpress_url: http://tartley.com/?p=349
---

[![screenshot Sole Scion
v1.0](/assets/2008/06/screenshot-sole-scion-v10.png "screenshot-sole-scion-v10"){.alignleft
.size-full .wp-image-350 width="500"
height="388"}](http://code.google.com/p/sole-scion)

[Everyone](http://sethgodin.typepad.com/seths_blog/2008/06/is-it-worthy.html)
today is [abuzz](http://www.codinghorror.com/blog/archives/001134.html)
with the 'release early, release often' sentiment, so I've decided to
get in the spirit and upload the first iteration of 'Sole Scion', my
summertime sabbatical game project.

Version 0.1 merely bounces some circles off an inclined plane
(pictured.) I aim to transform this into a 2D graphical adventure game,
in which I hope emergent fun will take place, once I populate the world
with enough twisty corridors, uniquely-shaped objects that need slotting
into the right places, and judicious instances of ornery fauna to
contend with.

It's written in Python, using
[Chipmunk](http://wiki.slembcke.net/main/published/Chipmunk) for rigid
body Newtonian dynamics, with Python bindings using
[Pymunk](http://code.google.com/p/pymunk/). Rendering, gameloop, sounds,
etc are handled by [pyglet](http://pyglet.org).

[Sole Scion is hosted on Google
Code](http://code.google.com/p/sole-scion), with Subversion read-access
and a source code tarball, including the redistributables for the above
dependencies, should anyone be curious. It has a [New BSD
License](http://www.opensource.org/licenses/bsd-license.php).

Feedback, thoughts and ideas, very welcome.

**Update**: I've only run it on Linux, but reportedly it also works on
Windows. Thanks Xtian!

**Update:** It also reportedly works under PyPy, provided you install
the 'functools' module. Thanks Maciej!

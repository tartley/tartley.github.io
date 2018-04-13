---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics, GameDev]
comments:
- {author: Horst JENS, author_email: horst.jens@spielend-programmieren.at, author_url: 'http://www.spielend-programmieren.at',
  content: "sitting behind you at the tutorial i had a good view about the progress\
    \ you made from Richar's code example to the eye candy you did (using Gimp on\
    \ Windows?).\r\nIt was really amazing watching you work. Do you plan to publish\
    \ your final Asteroid games somewhere ? I could use it for my http://ThePythonGameBook.com\
    \ project :-)", date: '2010-07-28 08:32:28 -0500', date_gmt: '2010-07-28 07:32:28
    -0500', id: 30638}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Horst,\r\n\r\nThanks! Yeah, I was using Gimp on Window.s (I tend to\
    \ stick with Windows during conferences, since for me it just seems to be more\
    \ reliable than Linux at dealing with external projectors.)\r\n\r\nYou're not\
    \ the first to ask if I could make the code available, but it is of course entirely\
    \ Richard's. Let me double check how he's licensed it and whether he has any preferences\
    \ about that, but if possible then I'll make it (with my diffs) available somewhere.\r\
    \n\r\nI love Gimp. That day I made extensive use of the path tool to draw the\
    \ asteroids, which lets you create a vector path out of straight lines or splines,\
    \ and then repeatedly draw over that path using any of the other drawing tools.\
    \ So I could draw the main outline of each asteroid with a firm green pencil line,\
    \ and then draw the same path again with a large, blurry paintbrush, to produce\
    \ the 'glow'.\r\n\r\nI'm not as happy with the shuttle. I feel like there's something\
    \ clever that could be done with the outlines or the negative spaces or the colors,\
    \ to make it more harmonious with the appearance of the asteroids, but whatever\
    \ it is I'm groping for, I couldn't find it. I should have asked the class for\
    \ ideas! Oh well. :-)", date: '2010-07-28 13:13:14 -0500', date_gmt: '2010-07-28
    12:13:14 -0500', id: 30651}
- {author: Greg, author_email: greg.nwosu@gmail.com, author_url: '', content: 'is
    this game tutorial online anywhere?', date: '2011-01-19 17:33:28 -0600', date_gmt: '2011-01-19
    17:33:28 -0600', id: 37802}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey Greg. It''s not online as far as I know. :-(', date: '2011-01-20 09:31:48
    -0600', date_gmt: '2011-01-20 09:31:48 -0600', id: 37815}
date: 2010-07-19 00:08:53 -0500
date_gmt: 2010-07-18 23:08:53 -0500
layout: post
published: true
status: publish
tags: []
title: Loving EuroPython Tutorials
wordpress_id: 1137
wordpress_url: http://tartley.com/?p=1137
...
---

I've been loving the two days of tutorials preceding the EuroPython
conference. This morning I attended [Richard
Jones](http://www.mechanicalcat.net/richard/log)' splendid *Introduction
to Game Programming*. It was an absolute pleasure to be walked through
the creation of an example game like this, using Python game libraries
like [pyglet](http://pyglet.org/) and [Cocos](http://cocos2d.org/), by
someone who really knows what he's doing. Also, it's nice to have
something visible to show after a morning's work:

\[caption id="attachment\_1138" align="alignnone" width="744"
caption="My asteroids"\]![My asteroids. Michael your idea of making
engine thrust always visible was exactly what I needed to help me
capture the
screenshot.](http://tartley.com/wp-content/uploads/2010/07/intro-to-game-programming.jpg "intro-to-game-programming"){.size-full
.wp-image-1138 width="744" height="489"}\[/caption\]

The code is based very heavily on samples that Richard provided and
talked us through in great detail, so although I now understand it
pretty thoroughly, I can't take much credit. Excepting, that is, for a
handful of minor tweaks I couldn't resist making along the way, like the
flickery animated engine thrust, that made me gurgle with delight.

For the artwork, I stole the shuttle icon (sssshhhhhh!), added the
engine thrust, and created the asteroids themselves entirely from
scratch in Gimp. They are just rotatable bitmaps, albeit designed in
homage of vector graphics of yore, complete with simulated CRT glow.
Brilliant!

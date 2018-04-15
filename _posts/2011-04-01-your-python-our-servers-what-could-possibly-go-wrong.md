---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Rafe Kettler, author_email: rafe.kettler@gmail.com, author_url: 'http://rafekettler.com',
  content: "I might use it. Features that would be nice to coax me and others to become\
    \ users:\r\n\r\n - ipython or bpython\r\n - Choice of python versions\r\n - Some\
    \ common extensions available (e.g. lxml).", date: '2011-04-01 20:01:54 -0500',
  date_gmt: '2011-04-01 19:01:54 -0500', id: 40881}
- {author: Terrasque, author_email: forum@thelazy.net, author_url: '', content: "Wohoo,\
    \ instant spambot host! :p\r\n\r\nwhile True: send_spam()", date: '2011-04-01
    20:04:21 -0500', date_gmt: '2011-04-01 19:04:21 -0500', id: 40883}
- {author: Ram Rachum, author_email: cool-rr@cool-rr.com, author_url: 'http://cool-rr.com',
  content: "I'd like to see a combination of an online Python shell and PythonTurtle:\r\
    \n\r\nhttp://pythonturtle.org/\r\n\r\nLetting people learn Python through the\
    \ browser without making them install anything would really lower the threshold\
    \ for getting people (especially children) excited about Python.\r\n\r\nBut of\
    \ course, there's probably not much money to be made doing this.", date: '2011-04-01
    21:59:35 -0500', date_gmt: '2011-04-01 20:59:35 -0500', id: 40887}
- {author: Leonhard, author_email: Leonhard.vogt@Gmx.ch, author_url: '', content: "Sounds\
    \ interesting. I would love to be able to use python on ipad, for simple things,\
    \ euler problems etc. and would probably pay for it if not too expensive.\r\n\r\
    \nEven better if it had also a script, which could be executed similar to Idle\
    \ and not only console. Would not need own modules, just a main script.", date: '2011-04-01
    22:56:30 -0500', date_gmt: '2011-04-01 21:56:30 -0500', id: 40889}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey. Thanks for the comments, people.\r\n\r\n@Rafe: We'd definitely want\
    \ to include all those things you mention. I'm envisaging we'd load it up with\
    \ all of the top few hundred PyPI packages, and see no reason we couldn't just\
    \ do that on every version of Python. I don't think we could literally provide\
    \ [i|b]Python directly, but we aim to emulate behaviour much like that ourselves,\
    \ in a Javascript client.\r\n\r\n@Terrasque: Heh! We're really wary of that. We\
    \ currently run user-supplied code in a chroot jail, which disallows access to\
    \ networking by default. We're thinking we'd let users access the network once\
    \ they've signed up with an identified account. Perhaps this means network access\
    \ is one of the features we ask people to pay for.\r\n\r\n@Ram: Something like\
    \ the Python turtle would be magnificent! I've been talking on twitter about possible\
    \ ways to provide PyGame or maybe OpenGL access - these with a turtle-like layer\
    \ on top would be great for adoption and instruction, as you say, and we're also\
    \ not sure how to monetize it without moving into providing training courses in\
    \ a big way. But maybe that's our word-of-mouth promotion tool?\r\n\r\n@Leonhard.\
    \ Yeah, we'd really like a way to allow users to create scripts, and separate\
    \ modules too. Maybe the way to do that is to provide a simple client-end process\
    \ which gathers up local files and submits them for remote execution? Not sure\
    \ about this.", date: '2011-04-02 12:42:58 -0500', date_gmt: '2011-04-02 11:42:58
    -0500', id: 40910}
- {author: David Jones, author_email: drj@climatecode.org, author_url: 'http://climatecode.org/',
  content: You should definitely check out <a href="scraperwiki.com" rel="nofollow">ScraperWiki</a>
    who already do a lot of this stuff.  You may even be able to use their (open source)
    code., date: '2011-04-04 19:40:30 -0500', date_gmt: '2011-04-04 18:40:30 -0500',
  id: 40983}
- {author: Sundar Srinivasan, author_email: krishna.sun@gmail.com, author_url: 'http://sunnyeves.blogspot.com/',
  content: "It would be fun. But needs more than just a python shell. You may need\
    \ to make the code immediately sharable with a fellow developer by integrating\
    \ something like git with it. \r\n\r\nIf you are thinking about Python code running\
    \ for a long time (that's when you go for the cloud), it would usually chunk a\
    \ lot of data. If the database is going to reside somewhere at the users' own\
    \ servers, they may very well run Python on those servers, because the network\
    \ connection and their local server speed are anyway going to bottleneck their\
    \ performance. So you may need to provide some kind of a database support.\r\n\
    \r\nBut if you are just thinking about education purpose for some Python newbie,\
    \ yes, it's a good idea.", date: '2011-04-07 19:40:12 -0500', date_gmt: '2011-04-07
    18:40:12 -0500', id: 41059}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@David. Hey, thanks for that - I hadn't looked at ScraperWiki at all,\
    \ I'm sorting through its components now.\r\n\r\n@Sundar. Thanks for the input!\
    \ You have indeed anticipated some genuine problems. We're working on providing\
    \ pretty much exactly what you suggest.", date: '2011-04-08 07:28:54 -0500', date_gmt: '2011-04-08
    06:28:54 -0500', id: 41071}
- {author: David Jones, author_email: drj@climatecode.org, author_url: 'http://climatecode.org/',
  content: '@Jonathan You should definitely talk to Francis Irving (CEO of ScraperWiki
    now), I can put you in touch if you don''t already know him.', date: '2011-04-08
    09:00:44 -0500', date_gmt: '2011-04-08 08:00:44 -0500', id: 41073}
date: 2011-04-01 17:33:46 -0500
date_gmt: 2011-04-01 16:33:46 -0500
layout: post
published: true
status: publish
tags: []
title: 'Your Python, Our Servers : What could possibly go wrong?'
wordpress_id: 1306
wordpress_url: http://tartley.com/?p=1306
---

We've been brainstorming for products to build. What do you think of
this one?

**Python Interactive Console in the Browser**

One idea is a CPython interactive console in the browser. Client is
Javascript, which sends the user's Python to execute in a sandbox on our
EC2 instances. Dirigible already has the infrastructure to support
running our user's arbitrary Python in a sandbox across our grid - so
we'd only need to strip the spreadsheet-UI off to expose this
functionality to end-users.

[![Python in the
browser](http://tartley.com/wp-content/uploads/2011/04/python-in-browser.png "Python in the browser"){.alignnone
.size-full .wp-image-1308 width="687"
height="487"}](http://tartley.com/wp-content/uploads/2011/04/python-in-browser.png)

Your console state is persistant - so you could start some
investigation, or a long-running statement, then log off, and then
reconnect to it later from another machine.

Since the Python runs on our servers, all the client needs is a working
browser with Javascript. You could run code from any device - even funky
things like iPads which don't traditionally make installing and running
Python very easy. Your only hinderance would be the keyboard. Since our
servers could be beefy, it would run substantially faster. We could help
to support running in parallel across several servers.

We could provide multiple versions of Python - and keep them fully
loaded with packages from PyPI - so you could use any combo without
having to install anything locally.

There are already [some](http://www.trypython.org "trypython")
[examples](http://runroot.com/ "runroot")
[of](http://shell.appspot.com "AppEngine shell")
[in-browser](http://www.datamech.com/devan/trypython/trypython.py "datamech")
[Python](http://www.skulpt.org/ "skulpt") consoles like this, but none
of them quite do what we'd hope to do.

We're also thinking of providing really simple tools so you could work
on scripts or programs locally, and then run them in the cloud with a
single command / button.

Generally we're thinking of running your stuff on our own EC2 servers.
Other applications might involve executing stuff on your own servers,
instead of ours, but thus far we haven't come up with applications of
this that offer much over fabric or a combination of an SSH session and
Unix program 'screen'.

Would you use this? What for? Do you think it's totally dumb? I'd love
to hear about it.

*Most* interestingly, would you pay for it? We're thinking free for
trivial uses, a few dollars for some advanced features (access to
networking, persistance) and scale up to support teraflop computing.

---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics]
comments:
- {author: jseb, author_email: jseb@finiderire.com, author_url: 'http://www.finiderire.com',
  content: "Hello,\r\n\r\nNice but two problems!\r\n\r\n1) don't make the assumption\
    \ that the memory buffer at init will be at a given state. On my computer, there\
    \ is a very unpleasant flashing at initialisation, before flowers conquers all\
    \ :)\r\n\r\n2) it's really slow on an Athlon 2000+, with gforce4MX CG. 6 fps in\
    \ the worst case. If i use \"-O\" flags, it's 12 fps in the worst case. Alas,\
    \ i don't know python, and have no idea about how it could be speed up.\r\n\r\n\
    But dont give up and continue this serie of article about pyglet, it's interesting!",
  date: '2008-02-25 13:21:29 -0600', date_gmt: '2008-02-25 13:21:29 -0600', id: 8271}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks jseb. I've just seen the same crazy flashing on my Windows machine\
    \ at work. I was wondering if I could get around it by grabbing a snapshot of\
    \ the desktop when we start, and explicitly writing that image to the background\
    \ when we render? That would also let us do some fun things, like subtly zoom\
    \ or rotate the desktop as we go. I'd love to try this out, but am in the thick\
    \ of a different idea for next week's post (tiling the plane to create a 2D game\
    \ world.)\r\n\r\nI wonder why it is so slow on your machine. Maybe I'm doing something\
    \ foolish that stops pyglet from correctly hooking up with the hardware acceleration,\
    \ so it all ends up being software rendered? I wonder if I could print out some\
    \ diagnostics on startup which might detect that situation? Hmmm...", date: '2008-02-25
    13:50:52 -0600', date_gmt: '2008-02-25 13:50:52 -0600', id: 8273}
- {author: stampson, author_email: phall@westga.edu, author_url: '', content: "In\
    \ windows on a Dell laptop with ati mobility video (m3 I think), I get 11.3 fps\
    \ without -O and 19ish with -O at first then moving up to close to 25fps once\
    \ it has zoomed significantly, and even up over 30 at times when there is very\
    \ little on the screen other than large bits of flower.\r\n\r\nIt starts with\
    \ the crazy flashing as well.\r\n\r\nThanks for posting these articles, more would\
    \ be exciting to see.", date: '2008-02-25 17:58:21 -0600', date_gmt: '2008-02-25
    17:58:21 -0600', id: 8286}
- {author: Jay, author_email: thecapacity@gmail.com, author_url: 'http://blog.thecapacity.com',
  content: "I've enjoyed these examples as I've just started trying to do something\
    \ with python &amp; graphics programing myself (with much to learn).\r\n\r\nI'm\
    \ particular interested in being able to create a pyglet \"window-less\" window.\
    \ Something like the old Windows 3.1 cockroaches that would scuttle from window\
    \ to window, i.e. a pyglet program without limits.\r\n\r\nOr something like an\
    \ intentional version of the \"desktop window\" artifact you've been getting,\
    \ maybe you can drape some flowers across window bars.\r\n\r\nGood luck with the\
    \ wedding!", date: '2008-03-20 01:48:00 -0500', date_gmt: '2008-03-20 01:48:00
    -0500', id: 9194}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks to everyone who's commented, it's a real inspiration to hear about\
    \ others playing around with the same stuff.\r\n\r\nJay: I agree that the hardware-accelerated\
    \ 'windowless window' application sounds amusing. I'm not sure how I'd go about\
    \ it, and would be very interested tohear how you get on.\r\n\r\nPersonally, I'd\
    \ like to try and fix the garish flashing error in my application above, by grabbing\
    \ a snapshot of the desktop at startup, and blitting that into the background\
    \ for each frame (instead of the glClear() call.) This then opens up cool possibilities\
    \ - you could zoom or rotate the desktop image, which I image might make for a\
    \ cool 'intro animation' as an application starts up.\r\n\r\nSadly that idea's\
    \ temporarily on the back burner while I investigate generating a 2D game world,\
    \ by tessellating the plane with polygons to create a large game world, with some\
    \ polygons missing to create tunnels and rooms, in which entities like the 'flowers'\
    \ above will grow and crawl around. Plus, visiting PyCon this week. And getting\
    \ married. Um...", date: '2008-03-20 02:53:20 -0500', date_gmt: '2008-03-20 02:53:20
    -0500', id: 9196}
- {author: very nice, author_email: phyo.arkarlwin@gmail.com, author_url: '', content: "Very\
    \ nice one!\r\nhow to draw to Desktop like you did ? Which flag in window to do\
    \ it ? When i run urs , it only goes using own window.", date: '2008-08-17 12:47:32
    -0500', date_gmt: '2008-08-17 12:47:32 -0500', id: 17043}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@very nice: Hey, thanks. It doesn''t really draw to the desktop, it''s
    just a regular fullscreen app. However, I never clear the buffer before drawing
    to it, and on my video card under Linux, that meant my OpenGL buffer was apparently
    originally filled with the image from my desktop (which is also OpenGL accelerated.',
  date: '2008-08-19 05:07:43 -0500', date_gmt: '2008-08-19 05:07:43 -0500', id: 17101}
- {author: 'tartley.com &raquo; Blog Archive &raquo; pyglet week 2: Better Vertex
    Throughput', author_email: '', author_url: 'http://tartley.com/?p=264', content: '[...]
    On to Part 3 - Some Pretty Flowers&#8230; [...]', date: '2008-09-12 00:27:47 -0500',
  date_gmt: '2008-09-12 00:27:47 -0500', id: 17662}
- {author: Dale Reidy, author_email: dale@nospam.cubicle2.nospam.net, author_url: 'http://blog.dalereidy.co.uk',
  content: "Cheers for writing these articles - really good stuff.\r\n\r\nJust for\
    \ giggles I popped psyco in and it stabilized out at ~62fps vsync disabled (ati\
    \ 4850)", date: '2009-11-02 18:49:53 -0600', date_gmt: '2009-11-02 18:49:53 -0600',
  id: 24210}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Ha! Good idea Dale, thanks for the comment.', date: '2009-11-11 09:45:51
    -0600', date_gmt: '2009-11-11 09:45:51 -0600', id: 24294}
date: 2008-02-25 01:35:33 -0600
date_gmt: 2008-02-25 01:35:33 -0600
layout: post
published: true
status: publish
tags: []
title: 'pyglet week 3 : Some Pretty Flowers'
wordpress_id: 285
wordpress_url: http://tartley.com/?p=285
---

This is just a refinement of [last week's
script](/pyglet-week-2-better-vertex-throughput). No massively significant changes,
just a bunch of minor tweaks.

-   The fans are replaced with slightly prettier flowers, with separate
    vertex and color arrays for each one.
-   Running with the python -O flag means we can render 800 flowers at
    30fps, no problem.
-   The camera can now be moved and rotated and zoomed. I just use this
    to subtly zoom in after the screen has filled with flowers
-   I discovered that if I fail to clear the screen before rendering,
    then I inherit the appearance of the desktop as a backdrop. No doubt
    this cannot be relied upon, and presumably doesn't happen on some
    other graphics hardware or operating systems, so YMMV (**Update:**
    yep - it looks CRAZY on Windows unless you uncomment the glClear()
    call). I won't be relying on this trick in future, but for now, on
    my machine at least, it looks like this:

![flowers1](/assets/2008/02/screenshot-flowers1.jpg)

![flowers2](/assets/2008/02/screenshot-flowers2.jpg)

![flowers3](/assets/2008/02/screenshot-flowers3.jpg)

![flowers4](/assets/2008/02/screenshot-flowers4.jpg)

![flowers5](/assets/2008/02/screenshot-flowers5.jpg)

![flowers6](/assets/2008/02/screenshot-flowers6.jpg)

[gameloop2c-flowers.py![Python
file](/assets/2008/02/doc-python.png)](/assets/2008/02/gameloop2c-flowerspy.zip "gameloop2c-flowers.py")

---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Andrew Poth, author_email: japoth@gmail.com, author_url: '', content: "Jonathan,\r\
    \nI noticed that in line 14 of your desktop-random.py program, where the image_extensions\
    \ array is defined and populated, the \"gif\" and \"bmp\" parameters are lacking\
    \ a leading period.  Was this an oversight?", date: '2011-03-22 16:08:40 -0500',
  date_gmt: '2011-03-22 16:08:40 -0500', id: 40422}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Yep! So it was! Thanks for the heads-up. Fixed!, date: '2011-03-22 17:17:52
    -0500', date_gmt: '2011-03-22 17:17:52 -0500', id: 40423}
date: 2008-02-23 01:41:37 -0600
date_gmt: 2008-02-23 01:41:37 -0600
layout: post
published: true
status: publish
tags: []
title: Random Wallpaper for Linux Gnome Desktop
wordpress_id: 278
wordpress_url: http://tartley.com/?p=278
---

![Desktop
screenshot](/assets/2008/02/desktop.jpg)

A humble little Python script to select a random image from a given
directory (defined at the start of the file) and use it as your Gnome
desktop wallpaper. Put it in your session startup programs to get a new
desktop each time you login. Coolio.

[![Python file](/assets/2008/02/doc-python.png)desktop-random.py.zip](http://tartley.com/wp-content/uploads/2011/03/desktop-random.py_.zip)

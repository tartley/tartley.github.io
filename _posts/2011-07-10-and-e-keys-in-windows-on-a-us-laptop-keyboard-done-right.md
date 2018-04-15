---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, MSWin-dev]
comments:
- {author: Random Passerby, author_email: jweede@gmail.com, author_url: '', content: 'Not
    to start a religious discussion, but on OS X straight out of a US box one presses
    opt+3 to get the &pound; symbol and opt+shift+2 for &euro;.', date: '2011-07-10
    15:55:43 -0500', date_gmt: '2011-07-10 14:55:43 -0500', id: 48426}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Yep yep, good call. I''m greatly enjoying my new MacBook Pro, courtesy
    of my fab new employer, but one has to work with all sorts of operating systems.',
  date: '2011-07-10 22:29:09 -0500', date_gmt: '2011-07-10 21:29:09 -0500', id: 48466}
- {author: Jon W., author_email: jweede@gmail.com, author_url: '', content: 'Nice.
    Speaking of working with operating systems of all sorts. Do you happen to know
    if Linux has a similar disposition to international characters?', date: '2011-07-10
    23:44:01 -0500', date_gmt: '2011-07-10 22:44:01 -0500', id: 48475}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey. I had to go figure it out. Turns out it can be done, if you go into
    ''System / Preferences / Keyboard / Layouts'' (in Ubuntu), and hit the ''Options...''
    button, and define a ''compose key'' (I chose right ctrl). Then you can hold the
    compose key and hit a few keystrokes to get some unusual characters. Not the greatest
    - I would prefer a simple ''alt-3'' or somesuch. Way it goes.', date: '2011-07-17
    18:30:50 -0500', date_gmt: '2011-07-17 17:30:50 -0500', id: 49714}
date: 2011-07-10 13:06:34 -0500
date_gmt: 2011-07-10 12:06:34 -0500
layout: post
published: true
status: publish
tags: []
title: '&pound; key in Windows on a US laptop keyboard, done right.'
wordpress_id: 1317
wordpress_url: http://tartley.com/?p=1317
---

The usual solution to typing non-US characters on a US keyboard in
Windows is to hold left-alt, then type on the numeric keypad:

£ Left-alt + 0163\
€ Left-alt + 0128

This is a pain on my (otherwise fabulous) Thinkpad laptop, because the
numeric keypad is accessed by holding the blue 'Fn' key while you tap
ScrLk, to toggle numeric keypad mode, and then doing the same again
afterwards to turn it off.

One inadequate alternative (on WindowsXP, YMMV) is to go into control
panel; Regional and Language Options; Languages; Details; Settings. Add
a new keyboard configuration, "United States-International", which
should be grouped under your existing language ("English (United
Kingdom)" for me.) OK all the dialogs, restart your applications.

Now you can simply type:

£  Right-alt + Shift + 4\
€  Right-alt + 5

The downside of this solution is that the "UnitedStates-International"
keyboard setting adds a bunch of other features, including 'dead-keys',
whereby quotes and other punctuation are used to add accents to letters,
which is overly intrusive if, like me, you hardly ever use accents.

Ultimate solution then, define your own personal keyboard layout.
Download the Microsoft Keyboard Layout Creator from here:
<http://msdn.microsoft.com/en-us/goglobal/bb964665>.

My end result is an MSI with which I can install a new keyboard layout,
which is exactly like 'US', but with the addition of £ on the key
right-alt + 3:

[windows-US-keyboard-layout-with-pound-on-right-alt-3](http://tartley.com/wp-content/uploads/2011/07/windows-US-keyboard-layout-with-pound-on-right-alt-3.zip)

The source .klc file is in there, so you could add your own tweaks on
top of that.

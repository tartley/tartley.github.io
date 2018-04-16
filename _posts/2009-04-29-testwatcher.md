---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing]
comments:
- {author: ravi, author_email: raeff@Eefsea.ee, author_url: '', content: I would love
    curses to work under windows!!, date: '2009-04-30 13:34:31 -0500', date_gmt: '2009-04-30
    13:34:31 -0500', id: 20835}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Yeah! I''m slowly coming round the the idea that for this to work properly,
    I''d have to whip up a double-buffer for the Windows terminal, assuming there''s
    some control character I can print to make the print position reset to (0, 0).
    I originally expected this would be a 20 line script, so this may be more effort
    that I can justify at the moment. Maybe someday...', date: '2009-04-30 18:26:56
    -0500', date_gmt: '2009-04-30 18:26:56 -0500', id: 20837}
- {author: Michael Foord, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com',
  content: "10/10 if you have an obscure fetish with the command line\r\n0/10 if you\
    \ don't\r\n\r\nOh, that's right - you use Vim.", date: '2009-06-15 16:46:44 -0500',
  date_gmt: '2009-06-15 16:46:44 -0500', id: 21607}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "That's right: Use Vim, FTW!\r\n\r\nIt even rhymes! How much more right\
    \ could it be?", date: '2009-06-18 09:35:51 -0500', date_gmt: '2009-06-18 09:35:51
    -0500', id: 21659}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey, hang on, there''s a WConIO module (http://newcenturycomputers.net/projects/wconio.html)
    that may help. It may be time to revisit this.', date: '2009-07-18 09:57:08 -0500',
  date_gmt: '2009-07-18 09:57:08 -0500', id: 22204}
date: 2009-04-29 23:02:59 -0500
date_gmt: 2009-04-29 23:02:59 -0500
layout: post
published: true
status: publish
tags: []
title: Testwatcher
wordpress_id: 755
wordpress_url: http://www.tartley.com/?p=755
---

Sometimes when programming I like to leave unit tests running
repeatedly in one window while editing the code and tests in another.
The bash command `watch` is useful for this, and can highlight the
differences between one invocation and the next in
inverse.

I wanted a version of `watch` for use on Windows, so I whipped up a
quick Python script,
[testwatcher](http://code.google.com/p/testwatcher/), which produces
output very similar to watch, but is cross-platform, and features not
just inverse text, but *yellow* inverse text. Woo-hoo!

``` shell_session
$ python example_test.py
F.F
======================================================================
FAIL: testThat (__main__.TestWatcherTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "example_test.py", line 12, in testThat
    self.assertEquals(0, randint(0, 10))
AssertionError: 0 != 4

======================================================================
FAIL: testThis (__main__.TestWatcherTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "example_test.py", line 9, in testThis
    self.assertEquals('one', object())
AssertionError: 'one' != d24460>

----------------------------------------------------------------------
Ran 3 tests in 0.001s

FAILED (failures=2)
_
```

Incidentally, the above test makes it very clear that Python objects in
successive processes get new addresses on Linux, but interestingly on
Windows the same addresses seems to get re-used for different processes.

I can't help but suspect this is a dumb script to have written - it
should only be a:

     while True:
        command

but in order to shoehorn the inverse text and colors in, it's grown to
300 lines - a hideous bloat for a minor superficial thrill. Plus the
Windows version flickers terribly - I'm currently using `system('cls')`
to clear the screen and then redraw it every second. I'll do some
searching for better ways to do it.

However - I've long wanted a Python interface to perform simple terminal
actions like colors and animation on different platforms (the standard
library 'curses' module that would otherwise do the job is simply not
implemented on Windows.) So maybe it's time I used this script as an
excuse to figure this out. Suggestions welcome.

**Update:** This idea may have now reached a viable fruition, documented
[here](http://tartley.com/?p=1247).

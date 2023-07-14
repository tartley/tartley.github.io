<!--
.. title: Testwatcher
.. slug: testwatcher
.. date: 2009-04-29 23:02:59-05:00
.. tags: file-watcher,geek,software,python,testing,terminal
-->

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

```python
 while True:
    command
```

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

**Update:** This idea may have now reached a viable fruition
[here](https://github.com/tartley/rerun2/).

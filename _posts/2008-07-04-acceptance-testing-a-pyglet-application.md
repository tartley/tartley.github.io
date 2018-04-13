---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing, Graphics]
comments:
- {author: mac, author_email: mac@multikultis.com, author_url: 'http://multikultis.com',
  content: "Awesome, precisely what I was waiting for. I am off to try it! (Me too\
    \ had no joy with the threads, this is how I googled and found this post).\r\n\
    \r\nI noticed however that this post is rather old. I was wondering if you had\
    \ further refined this idea, or if you found out any other way to do testing for\
    \ pyglet apps...", date: '2010-08-01 17:19:16 -0500', date_gmt: '2010-08-01 16:19:16
    -0500', id: 30951}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks mac. I haven't refined the idea since then - in the end, I found\
    \ that even with this sort of framework, adding extra system-level testing to\
    \ game-like OpenGL applications to be quite difficult (since I was thinking about\
    \ trying to analyse the appearance of what gets rendered on screen)\r\n\r\nSo\
    \ the ideas described here have been invaluable to serve as a smoke-test, to run\
    \ one or two simple system-level tests as shown, especially to run them on an\
    \ install (rather then from source), to check that everything still works after\
    \ being bundled up and then installed on various operating systems.\r\n\r\nIf\
    \ you do have any better ideas about what sort of things it makes sense to system-test\
    \ in an OpenGL application, I'd be all ears. Perhaps I'm having problems because\
    \ I'm trying to test it at the wrong level of abstraction.", date: '2010-08-02
    09:41:03 -0500', date_gmt: '2010-08-02 08:41:03 -0500', id: 31006}
- {author: mac, author_email: mac@multikultis.com, author_url: 'http://multikultis.com',
  content: "Although I am not new to Python, the one I am working on is my very first\
    \ OpenGL application. At the end I settled down for the following solution:\r\n\
    \r\nhttp://pastebin.com/Een75nWZ\r\n\r\nThe basic idea is that: \r\n1) Your test\
    \ suite will schedule \"run_next_test\" in the main application scheduler at regular\
    \ interval.\r\n2) Tests are kept in a circular buffer\r\n3) Tests can fail, succeed\
    \ or be postponed (if the environment is still not ripe to perform the test.\r\
    \n4) Test have full access to the window object, so they can test any propriety\
    \ of the entities or trigger any of their methods.\r\n\r\nMine - like yours -\
    \ is just a stub. It works for the kind of tests I want to perform right now,\
    \ but it has a few limitations. Most notably:\r\n- I am not using the standard\
    \ \"unittest\" (= my own test grammar)\r\n- Tests are scheduled at regular intervals\
    \ rather than been triggered by a specific condition.\r\n\r\nBoth of them - though\
    \ - could be circumvented with some extra work.\r\n\r\nPS: Your blog is the best\
    \ learning aid I could find on the intertubes for somebody - like me - new to\
    \ pyglet. Thanks!", date: '2010-08-02 12:52:51 -0500', date_gmt: '2010-08-02 11:52:51
    -0500', id: 31015}
date: 2008-07-04 17:30:58 -0500
date_gmt: 2008-07-04 17:30:58 -0500
layout: post
published: true
status: publish
tags: []
title: Acceptance testing a pyglet application
wordpress_id: 353
wordpress_url: http://www.tartley.com/?p=353
...
---

I've been trying to create a simple acceptance test for a
[pyglet](http://pyglet.org/)application. A thorough suite of acceptance
tests, verifying the correctness of all the shapes drawn to the screen
by OpenGL, sounds like far more work than I want to do. But a couple of
simple acceptance tests would be valuable, to check out basic things:
that the application runs; opens a fullscreen window; responds correctly
to some basic inputs and command-line options; and has an acceptable
framerate. Especially if I could quickly run this basic smoke test on
multiple operating systems.

I tried writing an acceptance test which ran the application-under-test
on a new thread. This didn't work for me \*at all\* (perhaps because
pyglet is not intended to be used with multiple threads), so for the
time being I'd given up, and was proceeding without acceptance-level
tests.

A couple of days ago I had the idea of a test that didn't involve
threading. Instead, it takes a list of test conditions (as lambdas), and
uses pyglet's own clock and scheduler to request a callback to a test
function - `try_condition()` - on every frame:

``` {.prettyprint}
    def try_condition(self, dt):
        if self.condition():
            self.next_condition()
        else:
            self.time += dt
            if self.time > self.timeout:
                self.fail("timeout on %s" % self.condition)
```

When `try_condition()` gets called by pyglet on the first frame, it
evaluates the value of `self.condition`. If `True`, then that first part
of the test has passed, and it gets the next condition off the list. If
`False`, then this function simply returns, to let the application
continue running. When `try_condition()` is called again on the next
frame, it resumes where it left off, testing out the same condition
again. After it has been trying the same condition for a long enough
time, it deems that condition to have failed, and raises an assertion
error.

Here is the rest of the class, which sets up the scheduled calls to
`try_condition()`.

``` {.prettyprint}
from unittest import TestCase
from pyglet import app, clock

class AcceptanceTest(TestCase):

    timeout = 1.0

    def set_conditions(self, conditions):
        self.conditions = conditions
        self.next_condition()
        clock.schedule(lambda dt: self.try_condition(dt))
```

So `self.conditions` is a list of lambdas that will be provided by the
acceptance test. Calling `self.next_condition()` merely plucks the next
condition off the list, into `self.condition`. If there are no more
conditions left, then the test has entirely passed and it requests the
application to terminate, by setting the pyglet member `window.has_exit`
to `True`.

``` {.prettyprint}
    def next_condition(self):
        if len(self.conditions) > 0:
            self.condition = self.conditions.pop(0)
            self.time = 0.0
        else:
            self.terminate()

    def terminate(self):
        win = self.get_window()
        win.has_exit = True

    def get_window(self):
        windows = self.get_windows()
        if len(windows) == 1:
            return windows[0]
        return None

    def get_windows(self):
        return [w for w in app.windows]
```

In future, I should probably allow the acceptance test code to specify a
different timeout value for each condition.

Anyhow, we can then write an acceptance test by inheriting from this
`AcceptanceTest` class, providing an appropriate list of conditions, and
then just calling the application's `main()` function. This function
won't return until the application exits, either when one of the
conditions times out and raises an assertion error, or else when all
conditions have passed and the test framework sets `window.has_exit`.

``` {.prettyprint}
from testutils.testcase import run_test
from acceptance_test import AcceptanceTest
from sole_scion import main

class AT001_app_opens_a_fullscreen_window(AcceptanceTest):

    def is_window_visible(self):
        win = self.get_window()
        return win and win.visible

    def is_window_fullscreen(self):
        win = self.get_window()
        return win and win.fullscreen

    def test_window(self):
        conditions = [
            self.is_window_visible,
            self.is_window_fullscreen,
        ]
        self.set_conditions(conditions)
        main()

if __name__ == "__main__":
    run_test()
```

The conditions don't simply have to be expressions to verify the
application state. They could stimulate the application by raising mouse
or keyboard events, etc, and then simply return `True` so that the test
harness would move right on to the next condition.

Early days with this idea, but it seems to work, and thus far I'm very
happy with it.

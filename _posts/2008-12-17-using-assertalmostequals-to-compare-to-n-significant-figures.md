---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing]
comments:
- {author: Tim Golden, author_email: mail@timgolden.me.uk, author_url: 'http://timgolden.me.uk',
  content: 'In case it helps, I think nose has this and a few other such things. And
    it runs unittests ok too.', date: '2008-12-17 16:57:48 -0600', date_gmt: '2008-12-17
    16:57:48 -0600', id: 18792}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Um. Can I comment on my own post? I think so. There are several problems
    with the above. For one, the behaviour isn''t symmetric with regard to the compared
    numbers. i.e. assertAlmostEquals(A, B) will not always give the same result as
    assertAlmostEquals(B, A). Needs a rethink.', date: '2008-12-19 15:04:00 -0600',
  date_gmt: '2008-12-19 15:04:00 -0600', id: 18826}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks Tim, I''ll definitely check that out!', date: '2008-12-21 00:42:50
    -0600', date_gmt: '2008-12-21 00:42:50 -0600', id: 18842}
- {author: Paul Hinks, author_email: paulhinks@sky.com, author_url: '', content: "Love\
    \ it Jonny ...!!!   Blaaagghhhh \r\n\r\nMerry Christamas !!", date: '2008-12-26
    21:46:10 -0600', date_gmt: '2008-12-26 21:46:10 -0600', id: 18893}
- {author: Michael Foord, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com',
  content: 'Well, as I''ve said before - although significant figures is an improvement
    on the brain dead default unittest assert behaviour it still isn''t fine grained
    enough for some situations. I''d like to see a ''delta'' option where you can
    specify the allowed degree of error in absolute terms (which may be half a significant
    figure or even one tenth). This behaviour is also symmetric. :-)', date: '2008-12-28
    14:30:10 -0600', date_gmt: '2008-12-28 14:30:10 -0600', id: 18901}
date: 2008-12-17 14:59:54 -0600
date_gmt: 2008-12-17 14:59:54 -0600
layout: post
published: true
status: publish
tags: []
title: Using assertAlmostEquals to compare to N Significant Figures
wordpress_id: 594
wordpress_url: http://tartley.com/?p=594
...
---

I want a Python unittest.assertAlmostEquals that compares numbers to N
significant figures, instead of N decimal places.

``` {lang="python"}
>>> test.assertAlmostEquals(1e-8, 5e-14)
>>>
```

Even though these two numbers differ by a factor of 5 million, when
comparing them to seven decimal places (assertAlmostEquals default
behaviour) they are equal.

I've made a first stab this by overriding assertAlmostEquals on a
subclass of TestCase, which retains the behaviour of the original, but
provides an extra keyword parameter *sigfig*.

The code and a unittest for it are below. One of the tests currently
fails, due to floating-point inaccuracy problems. I'll have to look at
it some more. Isn't this problem already solved somewhere?

``` {lang="python"}
import math
import unittest

class TestCase(unittest.TestCase):
    "Augments the assert methods of a unittest.TestCase"

    def __str__(self):
        return "%s.%s" % (self.__class__.__name__, self.__testMethodName)

    def _assertAlmostEquals(self, a, b, sigfig=7):
        if sigfig < 1:
            raise ValueError("assertAlmostEquals: 'sigfig' must be >=1")

        magarg = a or b
        if (magarg == 0) or ((a - b) == 0):
            return

        magnitude = int(math.floor((math.log10(magarg))))
        margin = 10**(magnitude - sigfig + 1) / 2.0
        diff_gt_margin = abs(a - b) - margin > -1e-15
        if diff_gt_margin:
            msg = '%s != %s to %d significant figures' % (a, b, sigfig)
            raise AssertionError(msg)

    def assertAlmostEquals(self, a, b, places=None, sigfig=None):
        if places is not None and sigfig is not None:
            raise ValueError("assertAlmostEquals: "
                "cannot specify both 'places' and 'sigfig'")
        elif places is not None:
            unittest.TestCase.assertAlmostEquals(self, a, b, places)
        elif sigfig is not None:
            self._assertAlmostEquals(a, b, sigfig)
        else:
            unittest.TestCase.assertAlmostEquals(self, a, b)

    def assertRaisesWithMessage(
        self, exceptionType, message, func, *args, **kwargs):

        expected = "Expected %s(%r)," % (exceptionType.__name__, message)
        try:
            func(*args, **kwargs)
        except exceptionType, e:
            if str(e) != message:
                msg = "%s got %s(%r)" % (
                    expected, exceptionType.__name__, str(e))
               raise AssertionError(msg)
         except Exception, e:
             msg = "%s got %s(%r)" % (expected, e.__class__.__name__, str(e))
             raise AssertionError(msg)
         else:
             raise AssertionError("%s no exception was raised" % expected)
```

And a test:

``` {lang="python"}
import unittest

from TestCase import TestCase

class TestableTestCase(TestCase):

    def testNothing(self):
        pass # pun intended

class AssertAlmostEqualsTest(TestCase):

    def setUp(self):
        self.test = TestableTestCase("testNothing")

    def testPreservesUnittestBehaviour(self):
        a = 0.1234567
        eps1 = 0.000000049
        self.test.assertAlmostEquals(a, a + eps1)
        self.test.assertAlmostEquals(a, a - eps1)

        eps2 = 0.000000051
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            a, a + eps2)
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            a, a - eps2)

    def testPreservesUnittestBehaviourWithPlaces(self):
        a = 0.1234567
        eps1 = 0.000049
        self.test.assertAlmostEquals(a, a + eps1, places=4)
        self.test.assertAlmostEquals(a, a - eps1, places=4)

        eps2 = 0.000051
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            a, a + eps2, places=4)
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            a, a - eps2, places=4)

    def testRaisesIfPlacesAndSigfigSpecified(self):
        self.assertRaisesWithMessage(ValueError,
            "assertAlmostEquals: "
                "cannot specify both 'places' and 'sigfig'",
            self.test.assertAlmostEquals,
            0, 0, places=4, sigfig=4)

    def assertSigFig(self, factor):
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1.23 * factor, 1.225 * factor, sigfig=3)
        self.assertAlmostEquals(1.23 * factor, 1.2251 * factor, sigfig=3)
        self.assertAlmostEquals(1.23 * factor, 1.2349 * factor, sigfig=3)
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1.23 * factor, 1.235 * factor, sigfig=3)

    def testSigfigNormal(self):
        self.assertSigFig(1)
        self.assertSigFig(1e-6)
        self.assertSigFig(1e+6)
        self.assertSigFig(1e+12)
        self.assertSigFig(1e-12)

    def testSigFigOfTwo(self):
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1.2, 1.15, sigfig=2)
        self.assertAlmostEquals(1.2, 1.151, sigfig=2)
        self.assertAlmostEquals(1.2, 1.249, sigfig=2)
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1.2, 1.25, sigfig=2)

    def testSigFigOfOne(self):
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1, 0.5, sigfig=1)
        self.assertAlmostEquals(1, 0.51, sigfig=1)
        self.assertAlmostEquals(1, 1.49, sigfig=1)
        self.assertRaises(AssertionError,
            self.test.assertAlmostEquals,
            1, 1.5, sigfig=1)

    def testRaisesIfSigFigZeroOrLess(self):
        self.assertRaisesWithMessage(ValueError,
            "assertAlmostEquals: 'sigfig' must be >=1",
            self.test.assertAlmostEquals,
            1, 1, sigfig=0.99)
        self.assertRaisesWithMessage(ValueError,
            "assertAlmostEquals: 'sigfig' must be >=1",
            self.test.assertAlmostEquals,
            1, 1, sigfig=0)
        self.assertRaisesWithMessage(ValueError,
            "assertAlmostEquals: 'sigfig' must be >=1",
            self.test.assertAlmostEquals,
            1, 1, sigfig=-1)

    def testHandlesArgsOfZero(self):
        self.assertAlmostEquals(0, 0)
        self.assertAlmostEquals(0, 0, places=4)
        self.assertAlmostEquals(0, 0, sigfig=4)

    def testHandlesIdenticalArgs(self):
        self.assertAlmostEquals(1.234, 1.234)
        self.assertAlmostEquals(1.234, 1.234, places=4)
        self.assertAlmostEquals(1.234, 1.234, sigfig=4)

if __name__ == "__main__":
    unittest.main()
```

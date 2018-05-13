---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing]
comments:
- {author: Harry, author_email: hjwp2@cantab.net, author_url: '', content: "Jonathan,\
    \ you know the answer:  *proper* functional tests with selenium... or maybe windmill?\r\
    \n\r\nAspirations aside, I'm fighting exactly the same issues in my moonlighting\
    \ project.  Separating out \"acceptance\" tests from unit tests, and getting the\
    \ django test client to behave...\r\n\r\nsome things I've learned along the way:\r\
    \n- an accidental trailing \"/\" in your urls passed to TestClient instances will\
    \ return \"permanent redirect\" responses, which may confuse you for a while!\r\
    \n- assertFormHasError doesn't actually check whether the form error is displayed\
    \ on the page\r\n- assertContains' count param is useful\r\n- difference between\
    \ response and response.content\r\n- found myself using lxml a lot to make assertions\
    \ about the structure of the html that comes out\r\n\r\nhappy pseudo-functional-testing,\
    \ yay!", date: '2011-07-14 18:19:56 -0500', date_gmt: '2011-07-14 17:19:56 -0500',
  id: 49168}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Harry, thanks for the thoughts. I definitely agree that Selenium or\
    \ similar should be part of our acceptance testing strategy, and we're working\
    \ on that in parallel. \r\n\r\nBut plenty of our 'end-user' functionality is stuff\
    \ like command-line scripts and web APIs. Things like this genuinely can be acceptance\
    \ tested directly from a unitest.TestCase, and it's this stuff I'm thinking about\
    \ today.", date: '2011-07-14 18:50:39 -0500', date_gmt: '2011-07-14 17:50:39 -0500',
  id: 49173}
- {author: Luke Plant, author_email: L.Plant.98@cantab.net, author_url: 'http://lukeplant.me.uk/',
  content: "I agree completely about the difficulty of this middle ground in testing.\
    \ I once used TDD to build a view which worked perfectly, about from one slight\
    \ problem when I tested it manually - I had forgotten to add a 'submit' button,\
    \ so it was impossible to use!\r\n\r\nOf course, much more complex problems occur,\
    \ especially with Javascript etc. We need to think about how Django can improve\
    \ in this area, and have at least some good default suggestions. For the admin,\
    \ as it will no doubt gain more Javascript functionality, we will also probably\
    \ have to have some concrete solution for Django's own code base.", date: '2011-07-14
    21:29:10 -0500', date_gmt: '2011-07-14 20:29:10 -0500', id: 49196}
- {author: Alex Marandon, author_email: al@smeuh.org, author_url: 'http://alexmarandon.com/',
  content: 'Have you looked into using nose or py.test? There are packages providing
    Django integration for both.', date: '2011-07-16 06:47:29 -0500', date_gmt: '2011-07-16
    05:47:29 -0500', id: 49478}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Hey Alex. I have only used 'nose' as a test discovery tool. I'll check
    out both of them. Thanks!, date: '2011-07-16 13:34:58 -0500', date_gmt: '2011-07-16
    12:34:58 -0500', id: 49521}
- {author: Antti Kaihola, author_email: akaihol+tartley@ambitone.com, author_url: '',
  content: 'Nose and django-nose have served me well.  I use Mock (the voidspace one)
    when writing unit tests, but mocking the ORM is rather cumbersome. Class-based
    views (when done properly) seem to be easier to unit test. I''m curious about
    solutions for integrating Selenium into test suites, too.', date: '2011-07-16
    20:29:20 -0500', date_gmt: '2011-07-16 19:29:20 -0500', id: 49572}
date: 2011-07-14 16:19:43 -0500
date_gmt: 2011-07-14 15:19:43 -0500
layout: post
published: true
status: publish
tags: []
title: 'Django testing 201 : Acceptance Tests vs Unit Tests'
wordpress_id: 1337
wordpress_url: http://tartley.com/?p=1337
---

I'm finding that our Django project's tests fall into an uncomfortable
middle-ground, halfway between end-to-end acceptance tests and proper
unit tests. As such they don't exhibit the best qualities of either. I'd
like to fix this.

We're testing our Django application in what I believe is the canonical
way, as described by the [excellent
documentation](https://docs.djangoproject.com/en/dev/topics/testing/).
We have a half-dozen Django applications, with a mixture of
`unittest.TestCase` and `django.test.TestCase` subclasses in each
application's tests.py module. They generally use fixtures or the Django
ORM to set up data for the test, then invoke the function-under-test,
and then make assertions about return values or side-effects, often
using the ORM again to assert about the new state of the database.

Not an Acceptance Test
----------------------

Such a test doesn't provide the primary benefit of an acceptance test,
namely proof that the application actually works, because it isn't quite
end-to-end enough. Instead of calling methods-under-test, we should be
using the Django testing client to make HTTP requests to our web
services, and maybe incorporating Selenium tests to drive our web UI.
This change is a lot of work, but at least the path forward seems clear.

However, an additional problem is that acceptance tests ought to be
associated with features that are visible to an end user. A single user
story might involve calls to several views, potentially spread across
different Django apps. Because of this, I don't think it's appropriate
for an acceptance test to live within a single Django app's directory.

Not a Unit Test
---------------

On the other hand, our existing tests are also not proper unit tests.
They hit the (test) database and the filesystem, and they currently
don't do any mocking out of expensive or complicated function calls. As
a result, they are slow to run, and will only get slower as we ramp up
our feature set and our test coverage. This is a cardinal sin for unit
tests, and it discourages developers from running the tests frequently
enough. In addition, tests like this often require extensive setup of
test data, and are therefore hard to write, so it's very
labour-intensive to provide adequate test coverage.

My Solution
-----------

**1) I've created a top-level acceptancetests directory.** Most of our
current tests will be moved into this directory, because they are closer
to acceptance tests than unit tests, and will gradually be modified to
be more end-to-end.

These acceptance tests need to be run by the Django testrunner, since
they rely on lots of things that it does, such as creating the test
database and rolling back after each test method. However, the Django
testrunner won't find these tests unless I make 'acceptancetests' a new
Django application, and import all acceptance test classes into its
tests.py. I'm considering doing this, but for the moment I have another
solution, which I'll describe in a moment.

We also need to be able to create unit tests for all of our code,
regardless of whether that code is within a Django model, or somewhere
else in a Django app, or in another top-level directory that isn't a
Django app. Such unit tests should live in a 'tests' package right next
to the code they test. I'm puzzled as to why Django's testrunner doesn't
look for unit tests throughout the project and just run them all, along
with the Django-specific tests.

**2) My solution to this is to augment the Django test runner**, by
inheriting from it. My test runner, instead of just looking for tests in
each app's models.py and tests.py, looks for subclasses of
unittest.TestCase in every module throughout the whole project. Setting
Django's settings.TEST\_RUNNER causes this custom test runner to be used
by 'manage.py test'. Thanks to the Django contributors for this
flexibility!

So the new test runner finds and runs all the tests which the default
Django runner runs, and it also finds our unit tests from all over the
project, and it also includes our new top-level 'acceptancetests'
directory. This is great!

One surprise is that the number of tests which get run has actually
decreased. On closer inspection, this is because the standard Django
test runner includes all the tests for every Django app, and this
includes not just my project's apps, but also the built-in and
middleware Django apps. We are no longer running these tests. Is this
important? I'm not sure: After all, we are not modifying the code in
django.contrib, so I don't expect these tests to start failing. On the
other hand, maybe those tests help to demonstrate that our Django
settings are not broken?

An appeal for sanity
--------------------

My solutions seem to work, but I'm suspicious that I'm swimming against
the current, because I haven't found much discussion about these issues,
so maybe I'm just well off the beaten path. Have many other people
already written a similar extension to Django's test runner? If so,
where are they all? If not, why not? How else is everyone running their
Django project tests in locations other than models.py or tests.py? Or
do they not have tests outside these locations? If not, why not? I'd
love to hear about it if I'm doing it wrong, or if there's an easier
approach.

**Update:** My [fabulous employer](http://rangespan.com/) has given
permission to release the test runner as open source:

<https://github.com/rangespan/django-alltestsrunner>

**Update2:** I like this post's numeric ID (check the URL)
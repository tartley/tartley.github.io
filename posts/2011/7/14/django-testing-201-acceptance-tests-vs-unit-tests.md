<!--
.. title: Django testing 201 : Acceptance Tests vs Unit Tests
.. slug: django-testing-201-acceptance-tests-vs-unit-tests
.. date: 2011-07-14 16:19:43-05:00
.. tags: Python,Testing
.. category: Python
.. link: 
.. description: 
.. type: text
-->


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
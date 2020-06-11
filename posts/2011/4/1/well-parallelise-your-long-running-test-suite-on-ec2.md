<!--
.. title: We'll parallelise your long-running test suite on EC2
.. slug: well-parallelise-your-long-running-test-suite-on-ec2
.. date: 2011-04-01 19:04:09-05:00
.. tags: Python
.. category: Python
.. link: 
.. description: 
.. type: text
-->


Another brainstorming project idea:

Some projects have a suite of tests which take a long time to run. This
hinders agility.

We could run these tests suites for clients across EC2 instances. We've
had great success at Resolver Systems in slicing a test run across
several machines and then recombining the results. No doubt some people
have similar solutions. In taking the hassle of configuring these
machines out of your hands, we could divide the test suite execution
time to a fraction of that taken running them in serial on a single
machine.

Additionally, we could run tests against multiple versions of Python, or
run acceptance / system tests, on multiple browsers. These can all be
run in parallel across as many instances as it takes.

The downside of this idea is that unit tests run very quickly, so we
provide no value there. Only for long-running acceptance tests is this a
useful service - and those are tricky because they so often require so
much custom configuration and resources in order to run. Also, like our
own acceptance tests, they may be running on Windows clients, which is a
more expensive VM to run on EC2.

I don't *think* it could be made to work with an arbitrary set of
projects' tests - the differences between how each project writes and
runs their tests are just too great. But we could provide a sort of
'snakebite light' - an available bunch of servers with a variety of
Python and browser versions which people could write tests to run
against.

Do many people have long-running acceptance tests suites that would run
on a cheap Linux-based VM? How comfortable would people be outsourcing
this sort of service which is so fundamental to your project? Do you
think we'd be overwhelmed by the difficulties inherent in custom
configuration each project would need to run their tests? Again, if you
love or hate this idea, I'd love to hear about it.
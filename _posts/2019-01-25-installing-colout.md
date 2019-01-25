---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Linux-dev]
comments: []
date: 2019-01-25 18:40:55 -0600
date_gmt: 2019-01-25 18:40:55 -0600
layout: post
published: true
status: publish
tags: []
title: Installing Colout
---

[Colout](http://nojhan.github.io/colout/) is amazing, I use it all the time.

But `pip install colout` from PyPI is broken, and has been for many months,
due to a typo in the
[latest (v0.5) PyPI release](https://pypi.org/project/colout/).

I've tried to contact the author, with email and
[issues](https://github.com/nojhan/colout/issues/101i) on the
[colout github project](https://github.com/nojhan/colout/issues).

This has had no effect, although I see the author has made substantial commits
to the github project in that time, including fixing this problem and tagging a
new v0.6 version, although has not released any of that to PyPI.

So, in increasing order of desireability, you can either:

Clone the latest repo [from github](https://github.com/nojhan/colout), and
install from that:

    # cd to the clone, then
    python3 -m pip install --user .

Or, pip install the version I uploaded to PyPI, which is a straight copy of the
latest github at the time:

    pip install --user colout-fix

Or, best of all, pip install straight from the original github repo:

    pip install --user git+git://github.com/nojhan/colout.git

Note that, throughout, we're using `--user`, so that you can install dev tools
like this system-wide for the current user, without needing a virtualenv,
without needing root access, and without modifying your installed Python
system libraries.


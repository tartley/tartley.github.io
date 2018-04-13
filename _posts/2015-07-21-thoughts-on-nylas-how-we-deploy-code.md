---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Python, Software]
comments: []
date: 2015-07-21 19:06:02 -0500
date_gmt: 2015-07-21 18:06:02 -0500
layout: post
published: true
status: publish
tags: []
title: Thoughts on Nylas' "How We Deploy Code"
wordpress_id: 1623
wordpress_url: http://tartley.com/?p=1623
...
---

Some thoughts on [Nylas' post "How We Deploy
Code."](https://nylas.com/blog/packaging-deploying-python)

The goals of making deployment consistent, reliable and fast are very
laudable, and the conclusion involving creating Debian packages is just
great. But in the spirit of geek nitpicking, I can't help but think the
justifications given are misguided, and overlook a simpler solution.

**&gt;&gt; pip does not offer a "revert deploy" strategy**

Yes it does. Throw away the virtualenv and create a new one using the
requirements.txt from an earlier release. This might be slow, but you
can both speed it up (see below), and you can keep old versioned
virtualenvs around, as a cache of the output of this slow step, so that
reverts (the time when you really want deploys to go quickly) require
only a couple of symlinks.

**Update:** Oooh, and I just had an idea. You could version virtualenvs
using a hash of the requirements, so that deploys which do not change
dependencies can share the same virtualenv. I've never tried that - it
might work?!?!

**&gt;&gt; Installing dependencies with pip can make deploys painfully
slow**

This is true. But it's not the final word on the matter.

Firstly, don't grab the dependencies you're installing from PyPI. Have a
local cache of them. That speeds up the install tremendously, not just
because no download takes place, but also because no trawling of PyPI
and author sites for possible alternate versions takes place. Some
people use a local PyPI instance, but I like simply using a directory
full of packages. Point pip at it using
'`pip install --no-index --find-links=packages -r requirements`'. The
'packages' directory could be checked into your project's repo, so that
once you've checked a project out, you have everything you need to
deploy to local VMs, even with no network connection at all. I wrote
about this [a while ago](http://tartley.com/?p=1423).

**&gt;&gt; Building your code separately on each host will cause
consistency issues**

So don't install dependencies using source packages, use wheels instead.
Then any slow or unreliable build step is done once, when you create the
packages directory, while deployment is now reliable and requires no
development tools on the production server such as compilers, headers,
etc.

**Update:** As a bonus, this will again substantially speed up the
creation of your virtualenv when deploying.

**&gt;&gt; Deploys will fail if the PyPI or your git server are down**

PyPI outages (or a package author deleting their package, which happens
routinely) are not a problem if you're deploying from a local source of
packages.

I agree that application code deployment shouldn't be done using a 'git
pull'. Accessibility to GitHub shouldn't be a single point of failure,
and the fewer development tools needed on production servers the better.
So export the code from git into a tar file when you cut a release, and
then push it out using scp at deploy time.

Having said all that, there are still advantages to having your whole
app and its dependencies handled by a single mechanism like Debian
packages, rather than more bug-prone ad-hoc scripts and Ansible config.
So I'm not at all against the final conclusions of the Nylas article.
(Hugs to you folks at Nylas!)

Dashed this out in ten minutes between daycare pickup and dinner being
ready. Apologies for the inevitable shoddyness.

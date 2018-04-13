---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Wes Winham, author_email: winhamwr@gmail.com, author_url: '', content: "We\
    \ wrote a tool called Terrarium to do basically this same thing: https://github.com/PolicyStat/terrarium\r\
    \n\r\nIt creates a relocatable virtualenv for you and stores it on S3 or a shared\
    \ file system. Then subsequent installs with the same requirements will just pull\
    \ down the existing virtualenv, making it just a file copy operation (plus some\
    \ path cleanup in some cases).", date: '2013-03-08 15:37:50 -0600', date_gmt: '2013-03-08
    15:37:50 -0600', id: 77409}
- {author: andy matthews, author_email: andymatthews@comcast.net, author_url: 'http://andyMatthews.net',
  content: 'Somewhat new to Python. If you''ve already got the packages downloaded
    then why would you need to pip install them again?', date: '2013-03-08 16:10:18
    -0600', date_gmt: '2013-03-08 16:10:18 -0600', id: 77412}
- {author: Brandon Rhodes, author_email: brandon@rhodesmill.org, author_url: 'http://rhodesmill.org/brandon/',
  content: 'Andy &mdash; the idea is that you commit the contents of the &ldquo;packages&rdquo;
    directory to version control along with your own source code. When you check the
    project out on a new laptop, or to a new production machine, you need to re-run
    &ldquo;pip&rdquo; in that new environment to get all the dependencies to appear.
    The &ldquo;packages&rdquo; directory means that, when that moment comes, you know
    that the install will succeed without needing the network &mdash; many has been
    the unhappy developer who, with their client or boss panicked that the service
    is down and a new production machine needs to be spun up, has discovered that
    PyPI is down or that some dependency has been installing the whole time from some
    *other* web site that is for the moment down.', date: '2013-03-08 17:18:26 -0600',
  date_gmt: '2013-03-08 17:18:26 -0600', id: 77416}
- {author: matt harrison, author_email: matthewharrison@gmail.com, author_url: 'http://hairysun.com/',
  content: "You can also run pip like so:\r\n\r\nPIP_DOWNLOAD_CACHE=$HOME/.pip_cache\
    \ pip install foo\r\n\r\nWhich will create and place packages in the cache, and\
    \ use those before downloading them again.", date: '2013-03-08 17:53:06 -0600',
  date_gmt: '2013-03-08 17:53:06 -0600', id: 77423}
- {author: Carl Meyer, author_email: carl@oddbird.net, author_url: 'http://oddbird.net',
  content: 'The download cache is quite a bit more fragile than the technique demonstrated
    in the article; really it doesn''t add any robustness against network failure,
    it just speeds things up (very slightly) if some of the packages are large. The
    reason is that the download cache only stores sdist tarballs indexed by URL. When
    using a download cache pip still has to use its normal PyPI+external-hosts scraping
    to figure out which sdists at which URLs to download in order to fulfill your
    requirements; only then can it check whether it has the sdists at those URLs cached
    already. So you still have most of the network dependency and latency. With the
    technique in the article you avoid _all_ network access.', date: '2013-03-08 18:24:44
    -0600', date_gmt: '2013-03-08 18:24:44 -0600', id: 77428}
- {author: matt harrison, author_email: matthewharrison@gmail.com, author_url: 'http://hairysun.com/',
  content: Cool. Thanks for the clarification, date: '2013-03-08 21:32:41 -0600',
  date_gmt: '2013-03-08 21:32:41 -0600', id: 77448}
- {author: Steve Lacy, author_email: slacy@slacy.com, author_url: 'http://slacy.com/blog',
  content: 'Wow, great to see that pip 1.3 properly handles recursive dependencies
    with --no-install --download!  This is so much better than before!  Good work
    guys!', date: '2013-03-09 00:06:43 -0600', date_gmt: '2013-03-09 00:06:43 -0600',
  id: 77457}
- {author: Olivier, author_email: olivier@lethanh.be, author_url: '', content: 'A
    lot of python developers  use Virtualenv which are a way to install python libraries
    in separate, isolated containers. It''s great when you need to use specific version
    of library, want to test a new library or want to install a library without root
    access or don''t want to taint your whole system with it. But then you may need
    to install multiple time the sames library which is why it''s nice to have an
    offline cache', date: '2013-03-09 11:08:32 -0600', date_gmt: '2013-03-09 11:08:32
    -0600', id: 77531}
- {author: mike bayer, author_email: mike_mp@zzzcomputing.com, author_url: 'http://techspot.zzzeek.org',
  content: 'Yeah I have a lot of "-f file:///" going on with pip, its interesting
    that 1.3 no longer needs that, but with "file:///" I also had to use absolute
    paths, as the pathing arithmetic within pip was also not consistent.  Here''s
    a github issue import of the ticket where I was complaining about this use case:
    https://github.com/pypa/pip/issues/111 (still open for some reason, I think its
    solved...).   If they''ve finally fixed the absolute pathing requirement then
    things are just peachy.', date: '2013-03-10 06:09:59 -0500', date_gmt: '2013-03-10
    06:09:59 -0500', id: 77649}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Yep, it''s all peachy: the command lines shown in the post were cut-n-paste
    from a working session using Pip 1.3.1.', date: '2013-03-10 16:44:50 -0500', date_gmt: '2013-03-10
    16:44:50 -0500', id: 77708}
- {author: 'A Smattering of Selenium #147 | Official Selenium Blog', author_email: '',
  author_url: 'http://seleniumhq.wordpress.com/2013/03/14/a-smattering-of-selenium-147/',
  content: '[...] pip in production? pip install : Lightspeed and Bulletproof is a
    useful trick which I know I&#8217;ve done variants of with java and ruby in the
    [...]', date: '2013-03-14 14:23:48 -0500', date_gmt: '2013-03-14 14:23:48 -0500',
  id: 78145}
- {author: Max Arnold, author_email: amv_cbx@mail.ru, author_url: '', content: 'There
    is a new tool called "devpi" which was announced during PyCon Russia 2013. Check
    out the slides https://speakerdeck.com/hpk42/re-inventing-packaging-and-testing-with-python
    and video https://www.youtube.com/watch?v=vKkHLNHpFUI', date: '2013-03-14 15:35:45
    -0500', date_gmt: '2013-03-14 15:35:45 -0500', id: 78150}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Wow, that''s impressive. Hope it''s getting some airtime at PyCon US this
    week too!', date: '2013-03-17 19:11:17 -0500', date_gmt: '2013-03-17 19:11:17
    -0500', id: 78468}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: I
    don't even know where this week-handed clock is!, date: '2013-06-23 17:56:49 -0500',
  date_gmt: '2013-06-23 16:56:49 -0500', id: 84158}
- {author: Daniel Chatfield, author_email: chatfielddaniel@gmail.com, author_url: 'http://www.danielchatfield.com',
  content: "I'm not sure what benefit this gives you over simply installing them locally\
    \ using:\r\n\r\npip install -r requirements.txt --target=packages\r\n\r\nThis\
    \ will download and install them into a directory.", date: '2013-07-26 13:47:36
    -0500', date_gmt: '2013-07-26 12:47:36 -0500', id: 111173}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey Daniel. Everything I cite in the post as an advantage of the method
    I describe (e.g. "works even if PyPI is unreachable") is something that is wrong
    with the command you quote. (e.g. the command you show will fail if PyPI is down
    or unreachable, and hence should not be used in your production deployments. Otherwise
    you will be unable to deploy new releases or urgent fixes just because PyPI is
    down, or because some other package author (accidentally?) deleted their package,
    etc, etc. Plus it''s really slow, which is a problem if you routinely re-create
    your virtualenv, for example when running tests. (which you should, for system
    / installer / deployment tests)', date: '2013-08-01 18:10:16 -0500', date_gmt: '2013-08-01
    17:10:16 -0500', id: 127691}
date: 2013-03-08 09:29:09 -0600
date_gmt: 2013-03-08 09:29:09 -0600
layout: post
published: true
status: publish
tags: []
title: 'pip install : Lightspeed and Bulletproof'
wordpress_id: 1423
wordpress_url: http://tartley.com/?p=1423
...
---

I saw a post about [speeding up the Python packaging command "pip
install"](http://www.scottisheyes.com/how-to-fix-slow-pip-install), by
specifying more responsive mirrors for querying and downloading
packages. For my situation, a better tactic is this.

Step one: Download all your project's dependencies into a local
'packages' dir, but don't install them yet:

`mkdir packages pip install --download=packages -r requirements.txt`

Step two, install from the 'packages' dir:

`pip install --no-index --find-links=packages -r requirements.txt`

*(The above syntax works on pip 1.3, released yesterday. Docs for older
versions of pip claim to support this, but in practice, for pip 1.2,
I've had to use
"`--find-links=file://$PWD/packages`{style="font-style: inherit;"}")*

Step 2 works even if PyPI is unreachable. It works even if some of your
dependencies are self-hosted by the authors, and that website is
unreachable. It works even if the version you have pinned of one of your
dependencies has been deleted by the author (some packages do this
routinely after security updates.) It works even if you have no network
connection at all. In short, it makes creation of your virtualenv
bulletproof.

As a nice side effect, it runs really fast, because it isn't downloading
the packages across the internet, nor is it attempting to scan a remote
index to check for matching or newer versions of each package. This is
much quicker than just using a Pip download cache, especially for large
projects with many dependencies which only change occasionally.

At [Rangespan](http://rangespan.com), we check the 'packages' directory
into source control, so that once you've checked out a project's repo,
you have everything you need to deploy locally and run, even if you have
no network. You might choose to treat 'packages' as ephemeral.

It was pointed out to me recently by
[@jezdez](https://twitter.com/jezdez), Pip maintainer, this usage
pattern has now been [explicitly called out in the
documentation](http://www.pip-installer.org/en/latest/cookbook.html#fast-local-installs),
which was substantially reorganised and improved with the recent 1.3
release.

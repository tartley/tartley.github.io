---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Rob C, author_email: rob_cowie@mac.com, author_url: '', content: "You beauty!\r\
    \n\r\nI use a virtualenvwrapper postmkvirtualenv hook to install ipython in every\
    \ new env. ipython takes an inordinately long time to download (enough time to\
    \ make a cup of tea and watch it go cold).\r\n\r\ncheers Mr Hartley!", date: '2010-07-13
    15:50:47 -0500', date_gmt: '2010-07-13 14:50:47 -0500', id: 29846}
- {author: Marius Gedminas, author_email: marius@gedmin.as, author_url: 'http://gedmin.as',
  content: Sweet!  The biggest advantage of zc.buildout over virtualenv was its egg
    cache., date: '2010-07-13 16:45:06 -0500', date_gmt: '2010-07-13 15:45:06 -0500',
  id: 29851}
- {author: Carl Meyer, author_email: carl@oddbird.net, author_url: 'http://www.oddbird.net',
  content: '@Marius Indeed, although pip''s download cache only goes halfway to buildout''s
    egg cache, IIUC (not a buildout user myself). It saves on bandwidth and download
    time, but not disk space. The package is still installed on disk separately within
    each virtualenv''s site-packages. Generally not a problem these days, though I
    do recall David Glick complaining a bit about it when experimenting with installing
    Plone via pip/virtualenv :-)', date: '2010-07-13 23:05:20 -0500', date_gmt: '2010-07-13
    22:05:20 -0500', id: 29862}
- {author: Paul H, author_email: paulhinks@sky.com, author_url: '', content: "I do\
    \ enjoy having a read throgh Tartley.com from time to time - much fun!!\r\n\r\n\
    Tell me Mr Hartley - where on this site can I download your asteroid game ...\
    \ screenshot looks smart ... now I just want to have firtle with it ... :)", date: '2010-07-25
    16:59:19 -0500', date_gmt: '2010-07-25 15:59:19 -0500', id: 30454}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@PaulH Hey. Good question. I''ll double-check that Richard''s code (which
    forms the vast majority of the game) is appropriately licensed, and add a download
    of it somewhere. Gimme a couple of days to unpack both laundry and my mind from
    europython...', date: '2010-07-26 09:07:27 -0500', date_gmt: '2010-07-26 08:07:27
    -0500', id: 30495}
- {author: Ben Sizer, author_email: kylotan@gmail.com, author_url: 'http://www.ebonyfortress.com/blog',
  content: 'So, is Pip working well enough on Windows? The "Maybe it doesn''t work
    on Windows." line on the website has always deterred me from trying it.', date: '2010-08-02
    11:35:32 -0500', date_gmt: '2010-08-02 10:35:32 -0500', id: 31011}
- {author: Carl Meyer, author_email: carl@oddbird.net, author_url: 'http://www.oddbird.net',
  content: "@Ben Pip's hg trunk (http://bitbucket.org/ianb/pip) received a lot of\
    \ Windows attention in May. The full test suite now passes on Windows, and there's\
    \ a continuous integration server making sure it stays that way (http://ci.cloudsilverlining.org/view/pip/).\
    \ The \"maybe it doesn't work on Windows\" line has also been removed from the\
    \ tip docs.\r\n\r\nThere isn't yet a released version with these fixes, but there\
    \ should be soon. (FWIW, I think most of the Windows fixes were to test-suite\
    \ platform sensitivities; by and large I think the latest pip release does work\
    \ fine on Windows already).", date: '2010-08-02 19:23:15 -0500', date_gmt: '2010-08-02
    18:23:15 -0500', id: 31043}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I do use pip on Windows as a replacement for ''easy_install'', and at
    that it works just fine for me, but I''m not making heavy use of virtualenv.',
  date: '2010-08-02 23:03:31 -0500', date_gmt: '2010-08-02 22:03:31 -0500', id: 31053}
- {author: easoncxz, author_email: me@easoncxz.com, author_url: 'http://blog.easoncxz.com',
  content: 'I think it''s worth noting that there''s a command line option available
    called `--download-cache`. (via <a href="http://stackoverflow.com/a/5338383/1349048"
    rel="nofollow">SO</a>)', date: '2014-02-04 01:48:40 -0600', date_gmt: '2014-02-04
    01:48:40 -0600', id: 739277}
- {author: 'Python:Can pip use existing packages rather than downloading again? &#8211;
    IT Sprite', author_email: '', author_url: 'http://www.itsprite.com/pythoncan-pip-use-existing-packages-rather-than-downloading-again/',
  content: '[&#8230;] it from: http://tartley.com/?p=1133 and works fine for [&#8230;]',
  date: '2015-10-07 20:58:17 -0500', date_gmt: '2015-10-07 19:58:17 -0500', id: 1061433}
date: 2010-07-13 12:46:15 -0500
date_gmt: 2010-07-13 11:46:15 -0500
layout: post
published: true
status: publish
tags: []
title: 'Undocumented feature of the week: $PIP_DOWNLOAD_CACHE'
wordpress_id: 1133
wordpress_url: http://tartley.com/?p=1133
---

Use Python? You should be using
[*Pip*](http://pypi.python.org/pypi/pip). A replacement for
*easy\_install*, that supports uninstalling and plays nice with
[*virtualenv*](http://pypi.python.org/pypi/virtualenv). An *apt-get* for
Python packages, if you will.

It has a marvellous undocumented feature. Set the environment variable
PIP\_DOWNLOAD\_CACHE to prevent re-downloading the same packages
repeatedly when setting up environments on the same machine:

```
> set | grep PIP
PIP_DOWNLOAD_CACHE=C:\Documents and Settings\jhartley\.pip_download_cache

> pip install mock
Downloading/unpacking mock
Creating supposed download cache at C:\Documents and Settings\jhartley\.pip_download_cache
 Downloading mock-0.7.0b2.zip (242Kb): 242Kb downloaded
 Storing download in cache at c:\documents and settings\jhartley\.pip_download_cache\http%3a%2f%2fpypi.python.org%2fpackages%2fsource%2fm%2fmock%2fmock-0.7.0b2.zip
[snip]
Successfully installed mock

> pip uninstall mock
[snip]
 Successfully uninstalled mock

> pip install mock
Downloading/unpacking mock
 Using download cache from C:\Documents and Settings\jhartley\.pip_download_cache\http%3A%2F%2Fpypi.python.org%2Fpackages%2Fsource%2Fm%2Fmock%2Fmock-0.7.0b2.zip
[snip]
Successfully installed mock
```

(This text is copied from my unholy bastardised shell of choice at work,
Windows CMD shell with Cygwin binaries foremost on the PATH.)

Using the download cache like this is substantially faster. Exactly what
you need if you're continually setting up environments under various
version of Python for testing or what-have-you.

The directory is created if it doesn't exist. Network access is still
required when installing like this, presumably for the version checks.

Thanks to the irrepressible
[fuzzyman](http://www.voidspace.org.uk/python/weblog/arch_d7_2010_07_10.shtml#e1185)
for bringing this to my attention.

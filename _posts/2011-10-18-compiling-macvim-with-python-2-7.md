---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Vim, OSX-dev]
comments:
- {author: horneds, author_email: horneds@gmail.com, author_url: '', content: 'Check
    this plugin: https://github.com/klen/python-mode', date: '2011-10-18 13:32:46
    -0500', date_gmt: '2011-10-18 12:32:46 -0500', id: 59579}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@horneds, that looks really cool, I hadn''t seen it before. Thanks for
    the pointer, I''ll try it out over the weekend.', date: '2011-10-18 17:15:00 -0500',
  date_gmt: '2011-10-18 16:15:00 -0500', id: 59630}
- {author: Richard, author_email: richard@mechanicalcat.net, author_url: '', content: 'Sadly
    the build doesn''t work for me. Attempting to open any Python source results in
    "ImportError: No module named site" printed to the console. I''m using a built-from-source
    Python 2.7.2...', date: '2011-10-19 01:44:21 -0500', date_gmt: '2011-10-19 00:44:21
    -0500', id: 59747}
- {author: Richard, author_email: richard@mechanicalcat.net, author_url: '', content: "Ah,\
    \ the problem is that I'm trying to get it to use the non-default Python (my default\
    \ is still the system install of Python 2.6). The MacVIM configuration gets mighty\
    \ confused.\r\n\r\nHad to delve into the configure script to figure this out,\
    \ but I needed to prefix the configure line setting vi_cv_path_python:\r\n\r\n\
    \"vi_cv_path_python=/usr/local/bin/python2.7 ./configure --enable-pythoninterp\
    \ ...\"\r\n\r\n(--with-python-config-dir wasn't needed - configure determined\
    \ the correct location without my help)", date: '2011-10-19 02:01:09 -0500', date_gmt: '2011-10-19
    01:01:09 -0500', id: 59751}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks again Richard! Post updated to lead people to your comment. :-)',
  date: '2011-10-19 13:51:17 -0500', date_gmt: '2011-10-19 12:51:17 -0500', id: 59891}
- {author: Luciano Pacheco, author_email: lucmult@gmail.com, author_url: 'http://blog.lucmult.com.br',
  content: "Thank you a lot! :-)\r\n\r\nI had a problem with perl and missing symbols,\
    \ I'd tried some more LDFLAGS, but at then end I just disabled perl.", date: '2011-11-18
    00:07:42 -0600', date_gmt: '2011-11-18 00:07:42 -0600', id: 62667}
date: 2011-10-18 12:25:03 -0500
date_gmt: 2011-10-18 11:25:03 -0500
layout: post
published: true
status: publish
tags: []
title: Compiling MacVim with Python 2.7
wordpress_id: 1355
wordpress_url: http://tartley.com/?p=1355
---

I love the brilliant Vim plugin
[pyflakes-vim](http://www.vim.org/scripts/script.php?script_id=2441),
which highlights errors & warnings, and since I got a MacBook for work,
I've been using MacVim a lot.

This combination has a problem, that MacVim uses the OSX system default
Python 2.6, so pyflakes is unable to handle Python 2.7 syntax, such as
set literals. These are marked as a syntax errors, which prevents the
rest of the file from being parsed.

The solution is to compile your own MacVim, using Python 2.7 instead of
the system Python. The following commands got MacVim compiled for me:

``` {lang="bash"}
#!/bin/bash
git clone git://github.com/b4winckler/macvim.git
cd macvim/src
export LDFLAGS=-L/usr/lib
./configure \
    --with-features=huge \
    --enable-rubyinterp \
    --enable-perlinterp \
    --enable-cscope \
    --enable-pythoninterp \
    --with-python-config-dir=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config
make
open MacVim/build/Release
echo Drag MacVim.app to your Applications directory
```

Without the LDFLAGS setting, I was missing some symbols at link. The
--with-python-config-dir entry came from typing 'which python' to find
where my Python 2.7 install lives, and modifying that result to find its
'config' directory (whatever that is) near to the binary.

As indicated, install by dragging the resulting
macvim/src/MacVim/build/Release/MacVim.app into your Applications
directory.

Open up MacVim, and check out the built-in Python version:

``` {lang="vim"}
:python import sys; print sys.version
2.7.1 (r271:86882M, Nov 30 2010, 10:35:34)
```

And files with set literals are now correctly parsed for errors.

**Update:** This only works if the Python 2.7 is your default 'python'
executable. Otherwise, or if you get "ImportError: No module named
site"?, see Richard's comments below.

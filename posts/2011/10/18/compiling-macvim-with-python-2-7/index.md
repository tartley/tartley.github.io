<!--
.. title: Compiling MacVim with Python 2.7
.. slug: compiling-macvim-with-python-2-7
.. date: 2011-10-18 12:25:03-05:00
.. tags: python,vim,osx-dev
.. link: 
.. description: 
.. type: text
-->


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

``` bash
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

```
:python import sys; print sys.version
2.7.1 (r271:86882M, Nov 30 2010, 10:35:34)
```

And files with set literals are now correctly parsed for errors.

**Update:** This only works if the Python 2.7 is your default 'python'
executable. Otherwise, or if you get "ImportError: No module named
site"?, see Richard's comments below.
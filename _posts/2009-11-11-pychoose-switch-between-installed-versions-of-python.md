---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Ted, author_email: tnm800@gmail.com, author_url: '', content: Awesome idea.
    Can't wait to see it develop and make it over to *nix eventually!, date: '2009-11-11
    19:08:28 -0600', date_gmt: '2009-11-11 19:08:28 -0600', id: 24304}
- {author: Gustavo Narea, author_email: me@gustavonarea.net, author_url: 'http://gustavonarea.net',
  content: "Hi.\r\n\r\nI don't know if you're aware of virtualenvwrapper:\r\nhttp://www.doughellmann.com/docs/virtualenvwrapper/\r\
    \n\r\nIt does that and more.\r\n\r\nCheers.", date: '2009-11-11 19:29:29 -0600',
  date_gmt: '2009-11-11 19:29:29 -0600', id: 24305}
- {author: Chris Arndt, author_email: chris.arndt@web.de, author_url: 'http://blog.chrisarndt.de/',
  content: "I don't think this is even needed on non-Windows systems. There, the Python\
    \ binary is usually not only installed as \"python\", but also as \"pythonX.Y\"\
    \ (the default version is often just a hardlink). You can switch between Python\
    \ versions on demand.\r\n\r\nThe same goes for easy_install (i.e. you have easy_install,\
    \ easy_install-2.5, easy_install-2.6, etc.) and I usually do the same with virtualenv:\r\
    \n\r\nsudo easy_install-2.4 virtualenv\r\nsudo cp /usr/bin/virtualenv /usr/bin/virtualenv-2.4\r\
    \nsudo easy_install-2.5 virtualenv\r\nsudo cp /usr/bin/virtualenv /usr/bin/virtualenv-2.5\r\
    \nsudo easy_install-2.6 virtualenv\r\nsudo cp /usr/bin/virtualenv /usr/bin/virtualenv-2.6\r\
    \n\r\nwhich leaves \"virtualenv\" as the default version using Python 2.6.", date: '2009-11-11
    19:46:39 -0600', date_gmt: '2009-11-11 19:46:39 -0600', id: 24306}
- {author: masklinn, author_email: m@m.com, author_url: '', content: 'You could always
    check how Macports''s python_select (warning: shell script) works (http://svn.macports.org/repository/macports/contrib/select/select.sh)',
  date: '2009-11-11 20:19:17 -0600', date_gmt: '2009-11-11 20:19:17 -0600', id: 24307}
- {author: ot, author_email: giuott@gmail.com, author_url: '', content: 'On UNIX environments
    BPT (http://pypi.python.org/pypi/bpt/) can be used for the same purpose: just
    install different python versions into different boxes. It also provides a fork
    of PIP to automatically install python packages from pypi inside the box.', date: '2009-11-11
    22:39:51 -0600', date_gmt: '2009-11-11 22:39:51 -0600', id: 24310}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'It doesn''t yet work with Python 3.0, nor with versions prior to the introduction
    of subprocess to the standard library. I fixed some of these issues earlier this
    evening, but on another PC - they will be checked in and/or updated on PyPI tomorrow.',
  date: '2009-11-11 23:13:31 -0600', date_gmt: '2009-11-11 23:13:31 -0600', id: 24311}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Gustavo Narea,\r\nThanks for the comment. The problem with virtualenvwrapper\
    \ is that it requires me to use virtualenv. The problem with using virtualenv\
    \ on projects where it isn't required is that I quickly end up with many virtual\
    \ environments per project - one per OS that I work on the project on, and also,\
    \ for Windows, one per machine that I work on the project from (since I can't\
    \ get --relocatable to work for me, at least not on Windows) Keeping them all\
    \ in sync and up-to-date starts to become a chore, and wastes hundreds of megabytes\
    \ of storage for *each* project, no matter how large or small.\r\n\r\nThe idea\
    \ of pychoose is that it would work without having to do any of that, regardless\
    \ of whether using virtualenv at all.\r\n\r\nHave I misunderstood at any step\
    \ along the way?", date: '2009-11-12 08:48:51 -0600', date_gmt: '2009-11-12 08:48:51
    -0600', id: 24318}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Chris Arndt,\r\nThanks for that! I think the technique of having 'pythonX.X'\
    \ executables around for each installed version is a good one, and I add my own\
    \ versions of this even on Windows. (if you add '.lnk' and '.exe.lnk' to your\
    \ PATHEXT variable, then you can make shortcuts to the different python versions,\
    \ which are executable from the command-line)\r\n\r\nThe problem though, which\
    \ pychoose is designed to overcome, is when you have some third party tool or\
    \ component which invokes python in a new process, simply as 'python' - I want\
    \ to be able to control which version of Python it will end up getting.\r\n\r\n\
    This is even true for my own components - I might want to distribute a tool which\
    \ invokes 'python'. I cannot make it invoke 'python2.5', because on Windows I\
    \ cannot count on such a shortcut existing on other people's systems. Nevertheless,\
    \ during development, I want to control which version of Python it invokes.\r\n\
    \r\nBest regards,", date: '2009-11-12 08:53:47 -0600', date_gmt: '2009-11-12 08:53:47
    -0600', id: 24319}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey masklinn and ot,\r\n\r\nThanks a lot - I will check out both BPT and\
    \ python_select.\r\n\r\nAnd Ted - thanks for the encouragement!", date: '2009-11-12
    08:57:52 -0600', date_gmt: '2009-11-12 08:57:52 -0600', id: 24320}
- {author: srid, author_email: sridhar.ratna@gmail.com, author_url: 'http://nearfar.org/',
  content: 'This is not necessary for ActivePython [activestate.com/activepython]
    which installs a "python26.exe" along with "python.exe".', date: '2009-12-02 06:02:43
    -0600', date_gmt: '2009-12-02 06:02:43 -0600', id: 24627}
- {author: srid, author_email: sridhar.ratna@gmail.com, author_url: 'http://nearfar.org/',
  content: '.. so more information in the comments here: http://nedbatchelder.com/blog/200512/multiple_python_installations_on_windows.html',
  date: '2009-12-02 23:26:48 -0600', date_gmt: '2009-12-02 23:26:48 -0600', id: 24639}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey srid, thanks for that.\r\n\r\nHaving a 'python26.exe' link is brilliant\
    \ - we discuss that idea further up in the comments.\r\n\r\nThe problem with that\
    \ though, is that it can only work when I'm invoking python manually from the\
    \ command line. I cannot build a program which invokes python like that, because\
    \ of course I cannot expect that python26 will exist on anyone else's system.\r\
    \n\r\nBest regards.", date: '2009-12-03 09:43:19 -0600', date_gmt: '2009-12-03
    09:43:19 -0600', id: 24646}
- {author: Edwin Commandeur, author_email: commandeur.edwin@gmail.com, author_url: '',
  content: "Instead of mingling with the path directly, isn't it easier to mingle\
    \ with a PYTHON_HOME environment variable?\r\n\r\nA simple batch script could\
    \ set PYTHON_HOME in the shell you have open. Then in path refer to %PYTHON_HOME%.",
  date: '2010-11-18 23:09:35 -0600', date_gmt: '2010-11-18 23:09:35 -0600', id: 34876}
- {author: Edwin Commandeur, author_email: commandeur.edwin@gmail.com, author_url: '',
  content: 'oops okay, so doing SETX to PYTHON_HOME with -m works, but then it is
    still necessary to open a new command window, unlike I had thought.', date: '2010-11-18
    23:50:15 -0600', date_gmt: '2010-11-18 23:50:15 -0600', id: 34878}
- {author: Edwin Commandeur, author_email: commandeur.edwin@gmail.com, author_url: '',
  content: "This kind of batch script works in admin mode of command line:\r\n\r\n\
    IF \"%1\" == \"3.1\" SETX PYTHON_HOME \"C:\\Program Files (x86)\\Python31\" -m\r\
    \nIF \"%1\" == \"2.7\" SETX PYTHON_HOME \"C:\\Program Files (x86)\\Python27\"\
    \ -m\r\n\r\nHowever, unlike I thought, I still need to open a new command window\
    \ to get the new Python version.", date: '2010-11-18 23:52:09 -0600', date_gmt: '2010-11-18
    23:52:09 -0600', id: 34879}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Ahar, yes, setx doesn't actually set the environment variable in the current\
    \ process - it just changes the registry for new processes.\r\n\r\nThanks heaps\
    \ for all of that Edwin, I'll have to go experiment with PYTHON_HOME, that might\
    \ be a much smarter solution...", date: '2010-12-09 18:05:20 -0600', date_gmt: '2010-12-09
    18:05:20 -0600', id: 35645}
date: 2009-11-11 16:07:10 -0600
date_gmt: 2009-11-11 16:07:10 -0600
layout: post
published: true
status: publish
tags: []
title: 'PyChoose: Switch between installed versions of Python'
wordpress_id: 883
wordpress_url: http://tartley.com/?p=883
...
---

You can switch between different installed versions of Python by simply
prepending to your PATH. However, this goes wrong in some scenarios,
such as when a tool like 'virtualenv' is installed in one Python
version, but not in another. Pretty soon you will be executing your
project with one Python version, but referencing the site-packages of
another. When switching, other versions of Python need to be stripped
from your PATH.

As a solution, I present a new Python module, *pychoose*. For the moment
this is Windows only:

    >python -V
    Python 2.6.4
    >easy_install pychoose
    ...
    >pychoose 24
    (Py24) >python -V
    Python 2.4.4
    (Py24) >exit
    >python -V
    Python 2.6.4

It prepends to the PATH as above, but it also filters other Python
versions out the PATH. It modifies the PROMPT to show the user they are
operating in a modified environment. It works by spawning a new shell
with the modified environment. To return to your default Python
interpreter, type 'exit'.

PyPI page: <http://pypi.python.org/pypi/pychoose>

Subversion repository:
[http://code.google.com/p/pychoose](http://code.google.com/p/pychoose/)

Preview the module [source
code](http://code.google.com/p/pychoose/source/browse/trunk/pychoose_script.py).

It seems to work for simple scenarios, but there are a bunch of known
problems with it (see the PyPI page above), which I'd like to fix if
people think this is useful. I just whipped this up and don't really
understand the issues surrounding this. In particular is spawning a new
shell the best way to modify the current console's environment? Is a
less-instrusive alternative to generate .bat file which can be executed
to change the current shell's environment?

Feedback & suggestions very welcome.

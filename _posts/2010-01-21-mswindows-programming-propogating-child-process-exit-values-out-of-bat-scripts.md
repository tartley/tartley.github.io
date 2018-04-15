---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software, MSWin-dev]
comments:
- {author: Owen Phelps, author_email: owen.phelps@s4c.co.uk, author_url: '', content: 'That''s
    great stuff, but one thing doesn''t fit my experience: "EXIT /B ERRORCODE" works
    as advertised for me, and I make use of that in various build scripts. We''re
    running XP here, don''t know how much that affects things.', date: '2010-02-03
    13:06:46 -0600', date_gmt: '2010-02-03 13:06:46 -0600', id: 25845}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Intruiging Owen, interesting to know that.\r\n\r\nI'm also on XP. I just\
    \ created a test script right now to verify that I'm really seeing the behaviour\
    \ I describe, and I still am.\r\n\r\nIf I create a script, tryme.bat, which contains\
    \ just the line:\r\n\r\nexit /B 42\r\n\r\nthen running this script from the command\
    \ line, just by typing its name, results in an %ERRORLEVEL% (or $? in Cygwin)\
    \ of zero, not forty-two. Have I misunderstood something? Are you doing anything\
    \ different?", date: '2010-02-04 11:52:13 -0600', date_gmt: '2010-02-04 11:52:13
    -0600', id: 25873}
- {author: Owen Phelps, author_email: owen.phelps@s4c.co.uk, author_url: '', content: "To\
    \ check, I created a batch file just as you described. Here's the results:\r\n\
    \r\nC:\\Temp>echo %ERRORLEVEL%\r\n\r\n0\r\n\r\nC:\\Temp>t.bat\r\n\r\nC:\\Temp>exit\
    \ /b 42\r\n\r\nC:\\Temp>echo %ERRORLEVEL%\r\n\r\n42\r\n\r\nThat's pretty conclusive\
    \ for me. I note that %ERRORLEVEL% only returns a value if Command Extensions\
    \ are enabled -- is it possible they are disabled on your system?", date: '2010-02-05
    10:36:22 -0600', date_gmt: '2010-02-05 10:36:22 -0600', id: 25885}
- {author: Menno Smits, author_email: menno@freshfoo.com, author_url: 'http://freshfoo.com/',
  content: "Nice workaround. \r\n\r\nMakes me glad I don't have to develop on Windows\
    \ much any more. It almost hurt to read this article.", date: '2010-02-09 10:30:28
    -0600', date_gmt: '2010-02-09 10:30:28 -0600', id: 25941}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Owen,\r\nThanks heaps for that last response. Yes, you are absolutely\
    \ right, I didn't have command extensions enabled. Enabling them fixes it.\r\n\
    \r\nHowever, I can't rely on that as a solution, because this script is intended\
    \ to be distributed publically. So I can't count on them being enabled on the\
    \ client machine.\r\n\r\nUnless I can enable them in the middle of my script?\
    \ It would probably be rude for me to do this permenantly, so then I need to undo\
    \ whatever I did. And then I need to exit with the correct exit value. But I need\
    \ to use 'exit' before I perform the undo. Ohdear, cascading idiocy detected...",
  date: '2010-02-10 14:09:53 -0600', date_gmt: '2010-02-10 14:09:53 -0600', id: 25955}
- {author: Owen Phelps, author_email: owen.phelps@s4c.co.uk, author_url: '', content: 'Well,
    it''s possible to do "CMD /E:ON /C whatever.bat", which forces command extensions
    on while running "whatever.bat", but I think your approach does the job, to be
    honest.', date: '2010-02-11 13:59:26 -0600', date_gmt: '2010-02-11 13:59:26 -0600',
  id: 25964}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Owen. Thanks for that. I didn't know that either. I was looking at\
    \ setting registry settings to enable extensions.\r\n\r\nIf it were just me typing\
    \ it, I could live with it, but I can't ask my users to remember to type that\
    \ whenever they use my program.\r\n\r\nI'm glad someone like you knows all these\
    \ tricks though - no doubt they will come in handy for me one day. Many thanks!",
  date: '2010-02-12 01:29:07 -0600', date_gmt: '2010-02-12 01:29:07 -0600', id: 25970}
- {author: Owen Phelps, author_email: owen.phelps@s4c.co.uk, author_url: '', content: 'No
    worries, chap. I enjoy reading your blog, and I''m glad I can give something back
    occasionally :-).', date: '2010-02-12 09:32:19 -0600', date_gmt: '2010-02-12 09:32:19
    -0600', id: 25976}
- {author: 'Python:Interface for modifying Windows environment variables from Python
    &#8211; IT Sprite', author_email: '', author_url: 'http://www.itsprite.com/pythoninterface-for-modifying-windows-environment-variables-from-python/',
  content: '[&#8230;] I once created a ghastly hack to modify the environment of the
    calling process on Windows, but it requires the calling process to co-operate:
    The called script wrote a .bat file to disk, and the calling process then &#039;exec&#039;s
    it or somesuch. tartley.com/?p=966 [&#8230;]', date: '2015-09-27 11:26:20 -0500',
  date_gmt: '2015-09-27 10:26:20 -0500', id: 1061299}
date: 2010-01-21 20:04:25 -0600
date_gmt: 2010-01-21 20:04:25 -0600
layout: post
published: true
status: publish
tags: []
title: 'MSWindows Programming : Propogating child process exit values out of .bat
  scripts'
wordpress_id: 966
wordpress_url: http://tartley.com/?p=966
---

"God *dammit*. Why won't you just DO what I WANT you hopeless pile of
crap!"

So goes the refrain. I think you know where I'm coming from. Yet again,
I have ended up learning far more about crappy DOS scripting than I ever
wanted to know.

So I'm writing a program to automate some small task on Windows. One of
the jobs of this tool is to modify the current environment. But I don't
know how a child process in Windows can modify the environment of it's
parent (namely the command-line shell that invoked it.) Can it be done?

So I hack a ghastly workaround: Wrap the script in a .bat file. A .bat
file is invoked from the command-line in the same process as the shell,
so any change it makes to the environment are made to the environment of
the invoking shell itself. This also has the advantage that the tool can
now be invoked by typing 'toolname', just like on other platforms, as
opposed to 'toolname.py' or even 'python toolname.py'. So I wrap my
Python script 'toolname.py' with a new file, 'toolname.bat', living in
the same directory:

```
:: first run our tool
python "%~dp0%~n0.py" %*

:: then make any changes to the environment
set THIS=THAT
```

The %\~dp0 and %\~n0 gobbledygook is a batch file way of referencing the
same drive, path and filename (minus extension) as the current script,
to which I add '.py' to run toolname.py. Easy enough.

There's a minor problem: The environment changes that need to be made
depend on what goes on inside toolname.py. So I have that Python write a
new batch file to the temp directory, containing all the 'set' commands
which will replace the hardcoded 'set THIS=THAT' in the above script.
Then we call that new temporary bat file from here:

```
:: first run our tool
python "%~dp0%~n0.py" %*

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat
```

Which is good enough. Presumably it will barf all over the place if run
concurrently. But there's a more pressing problem. I need the exit value
of this tool to be equal to the exit value from toolname.py. Currently,
the exit value of this .bat script is always zero, because the 'call'
command at the end is always successful.

One solution I've seen used is to remember the exit value from
toolname.py, and then use the DOS exit command to propagate this value
out to our caller:

```
:: first run our tool
python "%~dp0%~n0.py" %*
set EXITVAL=%ERRORLEVEL%

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat

exit %EXITVAL%
```

The problem with this is that 'exit' doesn't do what you think it does.
It doesn't just stop interpreting the current script, rather it
terminates the current interpreter, ie. the shell that is running the
script. If you run this from a command-line, since Windows doesn't
differentiate between a console and a shell, your window disappears.
*Sigh*.

The exit command has a fix for this: It takes a switch '/B', that causes
it to just end the current script, rather than killing the shell. But
now, it ignores any %EXITVAL% parameter you try to feed it, so the exit
value of your batch file is always zero.

This is what I get for developing software on Windows. Nothing ever
works the way it ought to. It's as though everything were designed to
oppose simple engineering idioms, like composing systems out of small,
interchangeable parts.

So here's what I finally did. The exit value of running a batch script
can be set without using the hopelessly brain-dead 'exit' command. It is
equal to the exit value of the last process the script invokes. So
instead of exit, simply find a process that will exit with the value you
need, and invoke it as the final command in your batch script:

```
:: first run our tool
python "%~dp0%~n0.py"; %*
set EXITVAL=%ERRORLEVEL%

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat

:: and propagate the exit value to our invoker
python -c "import sys; sys.exit(%EXITVAL%)"
```

Bingo. I now have a Python process that can modify the environment of
its invoking shell, and propagates the correct exit value out of the
wrapping DOS script. [Short bow. Applause. Roses. etc.]

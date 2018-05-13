---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software]
comments:
- {author: josh, author_email: a@b.cde, author_url: '', content: 'Just don''t.  If
    Cygwin seems like a good idea, move to Unix.  Because unless they''ve figured
    out how binary dependencies are supposed to work, it''s just not worth it.', date: '2008-07-10
    16:25:02 -0500', date_gmt: '2008-07-10 16:25:02 -0500', id: 15978}
- {author: Max, author_email: ihasmax@gmail.com, author_url: '', content: 'People
    using cygwin should be aware that, by default, their executables are linked with
    GPL cygwin libraries, meaning their code must now be GPL.  Add -mno-cygwin to
    gcc/g++ to avoid this.  Even still, the app might not work without the cygwin
    runtime libs.', date: '2008-07-10 21:20:30 -0500', date_gmt: '2008-07-10 21:20:30
    -0500', id: 15986}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Good points, Josh and Max. I figured it was OK for my friend, who only
    had access to Windows machines, and just wanted something which which he could
    try out simply C++ programs for his own benefit, but the considerations you raise
    are very pertinent in almost any other circumstance.', date: '2008-07-16 17:34:09
    -0500', date_gmt: '2008-07-16 17:34:09 -0500', id: 16076}
- {author: DoodiaHob, author_email: sweet0608@ua.fm, author_url: 'http://www.webmonkey.com/user/profile/Squirt',
  content: Thank you, date: '2008-08-02 22:17:58 -0500', date_gmt: '2008-08-02 22:17:58
    -0500', id: 16683}
- {author: Michael Foord, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com',
  content: By default MinGW will compile on windows without linking to any MinGW libraries
    that encumber your executables., date: '2008-08-07 21:49:11 -0500', date_gmt: '2008-08-07
    21:49:11 -0500', id: 16828}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks Michael. If anyone else is ever requires similar help I might try
    recasting the above exercise with a MinGW slant, see if there''s any mileage in
    that.', date: '2008-08-11 16:40:28 -0500', date_gmt: '2008-08-11 16:40:28 -0500',
  id: 16914}
- {author: Shashi, author_email: shashika7@gmail.com, author_url: '', content: "Thanks\
    \ alot for this article. I learnt how to run C program in Cygwin emulator.\r\n\
    is this emulator having C/C++ editor?\r\nThanks\r\nShashi Kant", date: '2008-08-22
    18:11:41 -0500', date_gmt: '2008-08-22 18:11:41 -0500', id: 17161}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Shashi,\r\nYes, it works with C++. You have to be sure to select the\
    \ 'g++' compiler during your Cygwin install, and then compile your programs using\
    \ 'g++' instead of 'gcc'.", date: '2008-08-27 14:31:56 -0500', date_gmt: '2008-08-27
    14:31:56 -0500', id: 17321}
- {author: VJ, author_email: digvijay_techy@yahoo.com, author_url: '', content: It
    was 10 years back that I ran C with the Turbo C tool...I wanted to get back and
    downloaded stuff but it was your article which helped me execute(that's all which
    matters)...thanks., date: '2009-07-06 22:37:36 -0500', date_gmt: '2009-07-06 22:37:36
    -0500', id: 22023}
- {author: nik, author_email: nikhil11_t@yahoo.in, author_url: '', content: thank
    you for your help.your article is very useful to new person who don't know cygwin,
  date: '2012-12-24 05:45:11 -0600', date_gmt: '2012-12-24 05:45:11 -0600', id: 70367}
- {author: samba, author_email: sambaus84@gmail.com, author_url: '', content: A very
    good article which is always in my bookmarks to help someone new to CYGWIN, date: '2013-01-25
    21:29:51 -0600', date_gmt: '2013-01-25 21:29:51 -0600', id: 73701}
- {author: rahul, author_email: rahul@gmail.com, author_url: '', content: "When i\
    \ type notepad myprog.c in the terminal it shows\r\n-bash:notepad:command not\
    \ found", date: '2013-07-27 07:28:15 -0500', date_gmt: '2013-07-27 06:28:15 -0500',
  id: 112737}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Rahul. If you using Cygwin on a Windows machine, then you might have\
    \ to add the directory of notepad.exe (or the text editor of your choice) to your\
    \ PATH environment variable. I'm on Windows 7 right now, and typing:\r\n\r\nwhere\
    \ notepad.exe\r\n\r\nshows me that it's in C:\\Windows\\System32\r\n\r\nIt seems\
    \ unlikely that this dir is not already on your PATH. Have a look, using something\
    \ like:\r\n\r\necho %PATH%\r\n\r\nIf it isn't present, then add it:\r\n\r\nset\
    \ PATH=%PATH%;C:\\Windows\\System32\r\n\r\nThen try the command again.\r\n\r\n\
    Alternatively, if you are actually on a Linux/Mac/other, then you won't have notepad.exe\
    \ available. Find another text editor that is present on your system.", date: '2013-08-01
    22:07:25 -0500', date_gmt: '2013-08-01 21:07:25 -0500', id: 127989}
- {author: Tony, author_email: tonyw@cs.utexas.edu, author_url: '', content: "Shouldn't\
    \ first line of the Hello World program be \"#include \", not just \"#include\"\
    ?\r\n\r\nAnyway, thanks so much - this was exactly what I was looking for! While\
    \ I typically use Ubuntu to run my C programs, occasionally I use Windows and\
    \ would like to test something, and this is the simplest way I've found to do\
    \ it.", date: '2013-08-28 05:42:59 -0500', date_gmt: '2013-08-28 04:42:59 -0500',
  id: 187925}
- {author: Jitesh, author_email: jiteshpatil1992@gmail.com, author_url: '', content: "Dear\
    \ friend when i launch the cygwin terminal and after that when i write command\
    \ \"ls\" i got error \r\n-sh: fork: retry: Resource temporarily unavailable\r\n\
    1019070 [main] -sh 4908 child_copy: linked dll data write copy failed, 0x5461E9000..0x5461E9068,\
    \ done 0, windows pid 8184, Win32 error 998\r\n1022044 [main] -sh 4908 fork: child\
    \ 5524 - couldn't copy linked dll data/bss, errno 11", date: '2013-09-04 19:59:14
    -0500', date_gmt: '2013-09-04 18:59:14 -0500', id: 205330}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Jitesh: Sounds like Cygwin isn't installed properly, if it can't even\
    \ run 'ls'.\r\n\r\nIf I were you, I'd uninstall it completely and install it again.",
  date: '2013-09-25 14:24:20 -0500', date_gmt: '2013-09-25 13:24:20 -0500', id: 241935}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Ha! Thanks Tony, looks like you were caught out by the same problem I
    was. Bloody WordPress. Is there a blogging software oriented for programmers rather
    than real people? Fixed now, anyhow.', date: '2013-09-25 14:25:59 -0500', date_gmt: '2013-09-25
    13:25:59 -0500', id: 241938}
- {author: jagadanna, author_email: jagadanna.bk@gmaill.com, author_url: '', content: "nice\
    \ job, very useful the beginners of cygwin....... could you tell me how to write\
    \ tcl script and run it ...?? do you have any information about xwinserver ??\r\
    \n\r\nthank you very much for the cygwin explained .....", date: '2014-02-11 05:21:21
    -0600', date_gmt: '2014-02-11 05:21:21 -0600', id: 750786}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I''m afraid I don''t know about either of those things, sorry!', date: '2014-03-24
    20:31:46 -0500', date_gmt: '2014-03-24 20:31:46 -0500', id: 835820}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@jleslie: In what way does it fail?', date: '2014-04-12 15:47:29 -0500',
  date_gmt: '2014-04-12 14:47:29 -0500', id: 888935}
date: 2008-07-09 22:57:50 -0500
date_gmt: 2008-07-09 22:57:50 -0500
layout: post
published: true
status: publish
tags: []
title: Writing C/C++ on Windows using g++ under Cygwin
wordpress_id: 358
wordpress_url: http://www.tartley.com/?p=358
---

I wrote this ages ago, for the benefit of a Windows user who wanted
guidance getting set up with a free C/C++ compiler to learn the
language. I recommended using the g++ compiler in a command-line
environment under Cygwin, with the following guide to getting started. I
recently found it lurking on my hard-drive, and figured it's not doing
any good to anyone sitting there, so here it is, just in case.

### Introduction

This article outlines one method of using the open source C/C++
compiler, Gcc to compile C/C++ programs on a Windows PC. It uses Cygwin,
which emulates a Linux-like command-line environment, which is many
times more useful and powerful than the DOS command line that comes out
of the box with Windows.

Of course, if you don't like all this free-as-in-beer,
free-as-in-speech, command-line hippy nonsense, you could always just
splash out for Visual Studio instead. Such a well-designed IDE has many
strengths - but so does the approach I am about to describe. Choose the
tool appropriate to the task in hand.

### Install Cygwin

Download and run setup.exe from <http://www.cygwin.com/setup.exe>

The root directory you specify to the installer, default C:\\cygwin,
will be your Unix root (/) directory under Cygwin. If this doesn't mean
much to you, see the (currently hyperthetical) section on Unix
filesystems below.

Install for all users, and leave default text file type as Unix, not
DOS. There are more [instructions for Cygwin
setup](%20http://www.cygwin.com/cygwin-ug-net/setup-net.html) online,
but my intention is that this document should be sufficient.

Eventually you get to choose which packages to install. This window is
resizable, even though it doesn't look like it. Maximise it. Also,
select the 'Curr' radiobutton on the top right - so that we only view
the current versions of each package. (as opposed to old or experimental
versions.)

Expand the categories on the left by clicking their '+' signs. The
'current' column is empty, because you don't yet have anything
installed. Under the 'new' column, you can click the word 'skip' to
select which version of each package you wish to install. This installer
understands the dependencies between packages, so selecting package A
which requires package B will automatically select package B.

Everything under the 'Base' category is already selected, plus their
dependencies. This is a minimal Cygwin install, to which we will now add
one or two things.

Under the 'Devel' section, find the entry for 'gcc. C compiler upgrade
helper.' Selecting the latest version of this package (3.3.3-2 as of 18
Aug 2004) will automatically select all the other parts of gcc that we
need (gcc-core, g++, etc.) as well as the 'binutils' package.

Make sure the following packages are selected:

-   Devel/gcc - will automatically select some other packages
-   Devel/make
-   Doc/cygwin-doc

You'll also need a text editor. You can either select and install one of
those listed in the Cygwin installer, or else use any Windows program.
Notepad will work fine for the moment. Download Textpad for Windows if
you want something a little more useful without being intimidating. Use
something like Vi or Emacs if you are already familiar with them.

Click [Next] when you're done. Setup downloads and installs the
selected packages.

### Run Cygwin

Double click the Cygwin icon on your desktop. You should get an
uninspiring DOS-like text terminal in a window. Type the command 'ls',
which lists the files in the current directory. From now on I'll show
commands you should type in `monospace`, preceded by a dollar sign,
possibly followed by expected output of the command, like this:

``` shell_session
$ ls
My Pictures My eBooks My Music
```

With any luck, you should recognise the files listed as those residing
in your My Documents directory.

I don't know how much/little Unix or Linux you know, so I'm going to
explain that as little as possible for now, and just press on with what
commands you need to type to get a C program compiled.

### Create a C file

Create a new directory within 'My Documents', where our C programs will
live. You can use Linux commands if you know them, or use your Windows
Explorer thing. I'm going to use Linux commands:

``` shell_session
$ mkdir cprogs
$ cd cprogs
```

(The 'cd' changes directory into the new 'cprogs' directory. Note that
the yellow '\~' above your dollar prompt has changed into a yellow
'\~/cprogs', to indicate this. So now if we type 'ls', then it lists
nothing - our new directory is empty.)

Next we want to create our c source file. If you installed vi or emacs
as part of the cygwin setup, then you can use these here:

``` shell_session
$ vi myprog.c
```

Otherwise, you can just use notepad, or any other windows text editor.
You can invoke it from the command line if you wish.

``` shell_session
$ notepad myprog.c
```

Enter and save the following minimal program:

``` cpp
#include <stdio.h>

int main(int argc, char ** argv)
{
    printf ("Hello world\n");
    return 0;
}
```

Notice that, while notepad is still open, you can no longer type
anything in your Cygwin terminal window. Cygwin is waiting for notepad
to finish before it lets you type anything else. Save and quit notepad
(now you can type again) and then run it once more, appending an
ampersand at the end of the command:

``` shell_session
$ notepad myprog.c &
```

The ampersand tells cygwin to run notepad 'in the background', while
allowing the cygwin terminal to continue accepting input. For example,
while notepad is still open, you can now issue a command to compile your
program.

### Compiling

To compile the program, we invoke the gcc program that we installed as
part of cygwin setup:

``` shell_session
$ gcc myprog.c -o myprog
```

This tells the program gcc to compile myprog.c, and to call the output
file myprog. If this produces error messages, check the program in
Notepad, save again (Ctrl+S in Notepad) and then recompile. Note that
you can re-issue the compile command by pressing the up arrow key, then
return. If the compile command produces no error messages, nor any other
kind of response, then the compilation has been successful. You can
verify this:

``` shell_session
$ ls myprog.c myprog.exe
```

(Note: on a real Unix/Linux box, the program would have no '.exe'
extension. It would simply be called 'myprog'.)

And to run your new program:

``` shell_session
$ ./myprog
Hello World
```

### Wrapup

That's the basics. You've got yourself a kick-ass C compiler (or C++
compiler if you invoke it with 'g++' instead of 'gcc') along with a
Linux-like environment to use it in. All for free, and without having to
repartition your existing Windows install or suffer the frustration of a
dual-boot system.

The Art of Unix
---------------

It should be noted that a real Unix/Linux development environment will
build on the arrangement described above, often in the Unix style of
'many small tools talking to each other', rather than as a single
monolithic application in the style of Visual Studio. This allows
competing tools to be slotted into place, giving the developer the
maximum freedom of choice. For example, it is trivial to replace Gcc
with the Intel C++ compiler, Icc, resulting in faster execution speed at
a cost of cross-platform compatibility. Such flexibility leaves the
developer free to retain their favourite text editor, debugger, etc,
regardless of the type of work or what project they are working on.

The command-line is often frowned upon by developers more familiar with
a GUI way of working, who tend to assume that such an ancient interface
represents a cruder way of working. In actual fact, the reverse is true.
A GUI is good for providing guidance to novice users, but ultimately
proves limited and inflexible. One can only use a GUI application for
exactly the uses the original developer envisaged. With a well-designed
command-line, the user is faced with a steeper learning curve, but is
then free to combine programs in novel and constructive ways.

For example, suppose we had 100 C programs to compile (not so
far-fetched if these are actually libraries or plug-ins.) In many IDE
GUI environments, the user would have no choice but to spend all
afternoon loading each program in turn and clicking the [compile]
button. Knowing a little command line magic, however, makes it a
ten-second job:

``` shell_session
$ for SOURCE in *.c;
> do
>   gcc $SOURCE -o ${SOURCE%.c};
> done
```

Each method has it's strengths and should be used where they are most
appropriate.
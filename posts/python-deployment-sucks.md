<!--
.. title: Python Deployment Sucks
.. slug: python-deployment-sucks
.. date: 2009-09-28 13:26:45-05:00
.. tags: software,python
-->


I don't want to whinge just for the sake of whinging. But I think it's
healthy to assess something I currently find difficult, that I might
better understand where the deficiencies lie and how they might be
addressed.

Deploying a Python program to fellow programmers is easy - just send
them the script, they can install the interpreter if they haven't
already, and figure it out from there. Use of PyPI helps with this.

But distributing Python as source code is only suitable when
distributing to other programmers. For distributing to end-users, it is
totally inappropriate. They have no idea what Python is nor whether it
is installed, and they should never need to know. While it is arguably
possible to lead a user through the process of installing Python so that
they can run your script, it is an absolutely ghastly, terrifying
experience for them, and they will never willingly use your software
again. They want an icon they can double-click on which just runs,
period. Considering the potential complications such as requiring
side-by-side installations of multiple versions of Python, I don't see
this as a workable solution for any serious software to be used by
non-programmers.

Thus we have the projects to convert Python source into stand-alone
executables. I've used *py2exe* and *bbfreeze*, and both do a brilliant
jobs at what they do. But there are problems with the use of such tools.

With a compiled language, you can simply give the binary to someone with
the right operating system, and they can double click it to run it.
Better still, this process of compiling and linking the executable for
an end-user is the *exact same process* that you perform all the time
for yourself while you are developing the software. There is no
additional overhead required to create an executable for end-users
(presuming the simplest case of end-users on the same operating system
that you are developing on.)

With Python this is not true. The whole 'create a distributable binary'
step is an additional headache over and above whatever effort you've
already gone to to make the program run in your own development
environment. Because of this, in a very pragmatic sense, deployment of
Python programs requires a whole extra set of work that deployment of
compiled programs does not.

Presumably this is true for all interpreted languages. I've never worked
seriously with one before. I should go read about how Ruby and more
venerable languages approach and solve these problems.

This situation would not be quite so bad if there was a clear way to
proceed, but for me, my first few binary distributable projects have
been a real ramshackle hack through the docs of py2exe and the various
projects which compete with it. Lots has to be figured out to choose a
tool, and then to get it working with your project. This has to be done
over for each OS you choose to deploy on. For me, it has been a real
time-sink, and I'm still not really happy with the results.

The resulting executables are bulked out by including the interpreter
with each one. This is not a suitable technique for including a bunch of
lightweight command-line executables to augment your shell -something
which, otherwise, you would think Python should be *absolutely ideal*
for. I guess in some circumstances you could work around this somewhat
by using an svn-style 'one executable, many commands' interface,
although this isn't always suitable.

I'd prefer it if, instead of bundling an interpreter, py2exe looked to
see if a suitable version of Python was already installed, and if not,
downloaded and installed it side-by-side with any existing installations
and then used it to execute your program.

I can't figure out how to tweak the output from py2exe such that my
executable file isn't buried in a menagerie of various other .dll, .zip
and .exe files. An end-user would have no idea what to click on. I want
to make it easy for my users, by creating an executable by itself, with
a subdirectory of binary dependencies (and a different subdirectory of
data.) I could sidestep this by creating an installer that creates a
shortcut to the relevant executable - but again, that would be yet
another day of needless make-work, which has to be undertaken over again
for each OS you plan to deploy on.

For large projects, these sorts of problems are surmountable - they have
enough man hours to soak it up. But for small projects and one-off
scripts, problems like this burn up a substantial proportion of time.
Writing a hundred-line script to solve your friend's particular problem
and emailing him the binary is awkward to say the least. Entries to the
PyWeek 'game in a week' contest are substantially impacted - producing
those binaries burns up hours and hours, when you have precious few to
spare, and very few of the presumably 'average developers' taking part
managed to create binaries that just worked for everyone.

In Python's favour, many of the wrinkles and complications that arise
during the process are due to cross-platform issues. Getting hold of
binary dependencies for other operating systems, stuff like that. The
only reason this seems harder in Python than it is in other languages,
is that when using other languages you often don't even *attempt* to
deploy across multiple operating systems. The apparent difficulty of
doing this in Python is in actual fact just an illusion caused by being
able to attempt it in the first place.

Doubtless some of my other perceived problems lie in my own
misunderstandings. Nobody else seems to struggle with this as much as I
do. Comments are welcome.

Brought to you from the a-crap-post-is-better-than-no-post-at-all dept.

---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: David Jones, author_email: drj@pobox.com, author_url: 'http://drj11.wordpress.com/',
  content: "Yes.\r\n\r\nI think you interpreted/compiled distinction is quite insightful,\
    \ programs written in interpreted languages will always be more difficult to deploy.\
    \  Though to be fair, compiled languages have some difficulties too.  Linkers\
    \ tend to aggressively link binaries to dynamic libraries, and if your users don't\
    \ have those libraries installed, or have incompatible versions... hell ensues.\r\
    \n\r\nMy antidote is to minimise my dependencies as much as possible.", date: '2009-09-28
    14:54:05 -0500', date_gmt: '2009-09-28 13:54:05 -0500', id: 23573}
- {author: Thierry Schork, author_email: tschork@gmail.com, author_url: '', content: "I\
    \ had the same gripes as you, until I found cx_Freeze (http://cx-freeze.sourceforge.net/cx_Freeze.html)\
    \ .\r\nWith py2exe, I had always executable that worked on some machines, not\
    \ on others, missing dll and error when the bundled interpreter tried to load\
    \ python extensions.\r\n\r\nSince trying cx_Freeze, making a binary is a simple\
    \ \r\nc:\\python26\\scripts\\cxfreeze myApp.py --target-dir bin\r\nand it has\
    \ never failed me until now.", date: '2009-09-28 15:57:05 -0500', date_gmt: '2009-09-28
    14:57:05 -0500', id: 23574}
- {author: Jon, author_email: jnelson@jamponi.net, author_url: '', content: "By and\
    \ large I couldn't agree more.\r\ndistutils was always fairly opaque, and setuptools\
    \ even more so.\r\n\r\nFor those systems which use RPM, at least \"python setup.py\
    \ bdist_rpm\" *usually* works, although --record is woefully inadequate to deal\
    \ with things like permissions, directories, configuration files, and so on. Novell\
    \ (openSUSE) has --record-rpm which fixes one of these issues (directories), in\
    \ many cases that small improvement is more than sufficient. Using the build RPM,\
    \ then, solves all of your issues.\r\n\r\nUsers of dpkg are rather more out of\
    \ luck.\r\n\r\nUsing setuptools/distutils --install directly comes with a great\
    \ many issues - conflicts with system-installed files and packages, complete invisibility\
    \ to the system software manager (and therefore no upgrades, updates, replaces,\
    \ dependencies, easy removal, etc...)  and in my experience causes premature aging\
    \ and baldness. *Use what your system uses* to manage software.\r\n\r\nPython\
    \ eggs seem like an excellent idea - a self-contained, location-agnostic bundle\
    \ that contains everything the software needs - however, eggs are really only\
    \ useful for libraries and don't work with software which requires binaries (or\
    \ scripts), init scripts, configuration files, and so on. I don't have a good\
    \ solution here.\r\n\r\nI don't have any real answers, but for me personally better\
    \ rpm support would be a big plus.", date: '2009-09-28 16:15:30 -0500', date_gmt: '2009-09-28
    15:15:30 -0500', id: 23575}
- {author: Brent Woodruff, author_email: brent@fprimex.com, author_url: 'http://www.fprimex.com',
  content: "I think everyone struggles with this issue, it's just that few people\
    \ talk about it.\r\n\r\nAnyone who has tried to create wxPython or PyQT applications\
    \ in a redistributable end user bundle has gone through this, and it is extremely\
    \ painful to figure out. There seems to be a common voodoo incarnation on each\
    \ platform that those in the know subscribe to.\r\n\r\nI wonder if the runtime\
    \ bundle idea being developed by the Panda3D folks could be generalized to generic\
    \ Python/wxPython/PyQT applications:\r\nhttp://blog.panda3d.org/?p=14", date: '2009-09-28
    16:35:18 -0500', date_gmt: '2009-09-28 15:35:18 -0500', id: 23576}
- {author: Rene Dudfield, author_email: renesd@gmail.com, author_url: '', content: "Agreed.\
    \  Definitely a problem.\r\n\r\ncheers,", date: '2009-09-28 16:45:53 -0500', date_gmt: '2009-09-28
    15:45:53 -0500', id: 23578}
- {author: Brandon Craig Rhodes, author_email: brandon@rhodesmill.org, author_url: 'http://rhodesmill.org/brandon',
  content: "&acirc;&euro;&oelig;...in a very pragmatic sense, deployment of Python\
    \ programs requires a whole extra set of work that deployment of compiled programs\
    \ does not.&acirc;&euro;\x9D\r\n\r\nBut that's because the compiled languages\
    \ require you to go through their equivalent of the whole py2exe step just to\
    \ run the program for yourself or exercise a unit test!  Surely the contrast here\
    \ is between compiled languages, where the long trial of compiling and linking\
    \ has to be surmounted in order to do anything at all with your program, and Python,\
    \ which only makes you go through the equivalent of Makefile/compiling/linking\
    \ when and if your program is ready to see the light of day.\r\n\r\nGiven the\
    \ number of Python scripts which only ever exist under one person's account, doing\
    \ a simple or complex task for them, I can only imagine that this is a huge win\
    \ for Python generally.\r\n\r\nBut, if you're finding that py2exe is a pain (it\
    \ creates several files, for example? instead of just storing them in a little\
    \ virtual filesystem inside the exe?) and that it's more difficult than the Makefile-etc\
    \ process for \"normal\" products, then, of course that should be addressed. \
    \ I'm just not sure that Python should be called inferior for letting the developer,\
    \ *if* they want to, avoid those steps until deployment.\r\n\r\nIf you're afraid\
    \ it's affecting the quality of your product, you're of course free to treat Python\
    \ as a compiled language and do development and test exclusively on the output\
    \ of py2exe, and pretend that the lightweight way of running your program&Acirc;&nbsp;&acirc;&euro;&rdquo;\
    \ which, as you point out, does *not* tell you exactly how it will look and behave\
    \ under py2exe &acirc;&euro;&rdquo; just doesn't exist.", date: '2009-09-28 17:28:00
    -0500', date_gmt: '2009-09-28 16:28:00 -0500', id: 23579}
- {author: Brandon Corfman, author_email: bcorfman@fastmail.fm, author_url: '', content: ">this\
    \ process of compiling and linking the executable for an end-user is the exact\
    \ same process that you perform all the time for yourself while you are developing\
    \ the software.\r\n\r\nWell, not really. Often there are various run-time dependencies\
    \ (such as a specific version of a C run-time library) when you compile an executable\
    \ on your development machine. Since many of these libraries aren't installed\
    \ on an end user's machine, you have to figure out all sorts of static or dynamic\
    \ library issues that don't occur on your own machine. If you haven't experienced\
    \ this before with a compiled language, I'm really stunned. Deployment on ANY\
    \ operating system is rough stuff, and it's why some people are hired simply for\
    \ their abilities and expertise with writing installation packages.", date: '2009-09-28
    17:31:33 -0500', date_gmt: '2009-09-28 16:31:33 -0500', id: 23580}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks all, especially @Brandon and @Brandon who point out a few very\
    \ reasonable caveats to the thrust of my gib.\r\n\r\nIn some ways I am historically\
    \ somewhat spoiled on this front, my work previous to Python having been mostly\
    \ on military or enterprisey software, which has either been deployed, often by\
    \ an entirely different team, to a single, very carefully controlled environment,\
    \ or in some cases has been converted into hardware (the ultimate performance\
    \ optimisation) rather than ever being deployed anywhere at all.\r\n\r\nI guess\
    \ my bleating is, to some extent, an emotional reaction, because I simply didn't\
    \ realise it was going to be this hard. Waaaaaah!", date: '2009-09-28 17:55:45
    -0500', date_gmt: '2009-09-28 16:55:45 -0500', id: 23581}
- {author: Steve Holden, author_email: steve@holdenweb.com, author_url: 'http://holdenweb.blogspot.com/',
  content: "I have beaten my head against the wall trying to convince the developers\
    \ that it's important, on the march to world domination, to consider the needs\
    \ of the non-programmer and to provide a distribution mechanism that doesn't depend\
    \ on a pre-installed Python interpreter (which is always going to be of dubious\
    \ provenance anyway).\r\n\r\nSadly, so far I have failed, and we are left with\
    \ distutils, setuptools, py2exe and the like. I am so frustrated I will certainly\
    \ be trying cx_Freeze, so if you r rant has no other effect it will at least have\
    \ brought that to more people's attention.", date: '2009-09-28 19:52:32 -0500',
  date_gmt: '2009-09-28 18:52:32 -0500', id: 23586}
- {author: Tom Willis, author_email: tom.willis@gmail.com, author_url: 'http://sadphaeton.com',
  content: 'While I share your frustrations, it''s not like JAVA, and .NET apps are
    any easier to deploy. They both have runtimes, and potentially reference many
    many libraries.', date: '2009-09-28 21:49:04 -0500', date_gmt: '2009-09-28 20:49:04
    -0500', id: 23588}
- {author: Chris Mellon, author_email: arkanes@gmail.com, author_url: '', content: "When\
    \ you build something with py2exe (default, minimal options), the output will\
    \ be a \"dist\" folder. It will contain 2 executables. Clicking on either one\
    \ will work (one is a booststrap for windows 95 machinest). Zip up the whole dist\
    \ folder, have the person you sent it to extract it somewhere (this step is important,\
    \ they can't just run it from inside winzip or windows zip file thing) and the\
    \ click whichever executable makes them happy.\r\n\r\nFor true single-file deployment\
    \ you can get the whole thing into a single executable with a couple py2exe options.\
    \ If you look inside your pythonroot/lib/site-packages/py2exe folder, there will\
    \ be some samples which include the flags for single-executable deployment.",
  date: '2009-09-28 22:10:25 -0500', date_gmt: '2009-09-28 21:10:25 -0500', id: 23589}
- {author: louiz', author_email: louizatakk@fedoraproject.org, author_url: 'http://blog.louiz.org/',
  content: It sucks only on Windows. Please don't make a generality of your OS's defects.,
  date: '2009-09-28 22:41:47 -0500', date_gmt: '2009-09-28 21:41:47 -0500', id: 23592}
- {author: David Boddie, author_email: david@boddie.org.uk, author_url: '', content: "I've\
    \ heard good things about PyInstaller:\r\n\r\nhttp://www.pyinstaller.org/\r\n\r\
    \nReally, deployment tools should let the native packaging system handle all the\
    \ heavy lifting (on systems with package managers). Why isn't there a general\
    \ purpose deployment tool that can generate system-specific packages using a set\
    \ of community-contributed plugins?", date: '2009-09-28 22:50:33 -0500', date_gmt: '2009-09-28
    21:50:33 -0500', id: 23593}
- {author: Chris Withers, author_email: chris@simplistix.co.uk, author_url: '', content: 'Why
    fight the fight? Other people have done this all already. Take a look at some
    of the great Windows and Mac installers already available in the open source python
    world, Zope and Plone spring to mind, and copy what they did :-)', date: '2009-09-29
    08:53:49 -0500', date_gmt: '2009-09-29 07:53:49 -0500', id: 23599}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "@louiz: The thing is, it's not just my OS: It's the majority of all user's\
    \ OS. So it *is* fair to make a generality out of this.\r\n\r\n@Chris Mellon:\
    \ Thanks heaps for the py2exe info: I'll go back and re-examine the docs and samples\
    \ then.\r\n\r\n@David Boddle: Many thanks for the recommend, I'll certainly go\
    \ try it out.\r\n\r\n@Chris Withers: I'm not interested in an installer, I don't\
    \ yet have any need for one. If we're accidentally talking at cross purposes (sorry!)\
    \ and you meant 'binary executable' rather than installer, then I get the impression\
    \ that the config for each is very project specific - that's exactly why putting\
    \ it together is so fiddly. However, on the offchance I'm wrong wrong wrong, it\
    \ won't hurt me to accept your advice and see how other established projects handle\
    \ this. Thanks!\r\n\r\n@Thierry Schork: plus belated thanks to you too - I'll\
    \ definitely try out cx_freeze too.\r\n\r\nNice to know I'm not alone, thanks\
    \ for the general encouragement everyone.", date: '2009-09-29 09:36:01 -0500',
  date_gmt: '2009-09-29 08:36:01 -0500', id: 23600}
- {author: j_king, author_email: james@agentultra.com, author_url: 'http://agentultra.com',
  content: "Well, this certainly isn't an issue with Python-the-language but is definitely\
    \ an issue for Python programs.\r\n\r\nI've been working on a GTK application\
    \ I originally wrote in Python over the summer. It's my hope to package it up\
    \ for end-users, but I know that its a pretty long shot. I've been tempted to\
    \ simply port it to another language before I get much farther in to save myself\
    \ the head-ache.\r\n\r\nA lot of this can of course be mitigated by writing a\
    \ better/standard packaging system and platform installers for each OS. As it\
    \ is right now there are probably as many packaging options as there are web frameworks\
    \ and its all quite confusing. If we had a standard package format that stored\
    \ enough meta-data for platform-specific installers to parse the contents of the\
    \ package and install everything in the proper place for its OS; we might have\
    \ a decent solution to this very specific problem.", date: '2009-09-29 14:23:40
    -0500', date_gmt: '2009-09-29 13:23:40 -0500', id: 23607}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey. Can one of the people suggesting that this problem doesn't exist\
    \ on Linux please tell me how I'm supposed to do it there?\r\n\r\nFor the record,\
    \ I love Linux. It is my favourite and most frequently used operating system.\
    \ I think a few people have inferred that because I discuss the above problem\
    \ in a Windows context, that's because I am a Windows user and developer. Nothing\
    \ could be further from the truth. I just started on Windows binary distribution\
    \ first because that's where all the users are.\r\n\r\nSo now I'm looking at how\
    \ to do it on Linux. And short of invoking bbfreeze, which seems to be *exactly*\
    \ as fiddly as py2exe is, for all the same reasons, I have no idea how to go about\
    \ it. So what *is* the simple Linux solution?\r\n\r\nFor a brief period, I wondered\
    \ whether people might be talking about making a 'bdist' - but that was just because\
    \ I didn't understand what a bdist was. Having read about it, it doesn't seem\
    \ to be remotely what I need.\r\n\r\nSuggestions gratefully received, many thanks.",
  date: '2009-09-30 14:38:01 -0500', date_gmt: '2009-09-30 13:38:01 -0500', id: 23624}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: People say the solution on Linux is to make an rpm. That might work. I
    think it's a lot of work. I might be wrong. I'll have to try it out., date: '2009-11-12
    11:14:51 -0600', date_gmt: '2009-11-12 11:14:51 -0600', id: 24321}
- {author: 'tartley.com : Comparing methods of deploying Python applications', author_email: '',
  author_url: 'http://tartley.com/?p=878', content: '[...] had a cry last month about
    deploying a Python application to end-users being more fiddly and difficult than
    I [...]', date: '2009-11-12 12:18:24 -0600', date_gmt: '2009-11-12 12:18:24 -0600',
  id: 24322}
- {author: Tim Desjardins, author_email: dt42lo@canoemail.com, author_url: '', content: 'Suck
    it up butter cup, there those that do and those that whine. py2exe and a few instructions
    on what binary to execute should be sufficient.', date: '2009-11-21 05:43:29 -0600',
  date_gmt: '2009-11-21 05:43:29 -0600', id: 24467}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Har. Thanks for the sand-in-face encouragement TimD, it may be exactly
    what I needed.', date: '2009-11-24 11:36:56 -0600', date_gmt: '2009-11-24 11:36:56
    -0600', id: 24517}
- {author: duke'm, author_email: dlukeparker@austin.rr.com, author_url: '', content: "I\
    \ feel your pain. I can't make it any better, but I can make it worse. I come\
    \ to python after a long period of using Tcl for tools of the kind you are targeting\
    \ here, and am spoiled to death. There is a thing in that world called a \"starpack\"\
    \ which is the single file executable that you want, that is trivial to build\
    \ and trivial to build for multiple target platforms. The trick is that the Tcl\
    \ runtime supports \"virtual file systems\" which appear at the language level\
    \ to be regular file systems. You pack up your stuff into a VFS, concatenate that\
    \ to the Tcl shell executable, and there you are. Google tclkit. \r\n\r\nI really\
    \ wish all the other languages I use could do this, but it is unlikely to come\
    \ true. The fact is the result of great design by one clever fellow, combined\
    \ with the excellent design of the language's runtime in the area of the I/O abstraction\
    \ layer. Unless the python (or Java or Ruby . . . ) core is designed with this\
    \ kind of abstraction, it isn't going to happen.\r\n\r\nIt really makes me sad,\
    \ as I want to do so much with Python that ends up being really hard because of\
    \ this problem.", date: '2010-06-11 19:25:56 -0500', date_gmt: '2010-06-11 18:25:56
    -0500', id: 28561}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Interesting to hear about all that duke'm - I'll go read about it. Thanks!,
  date: '2010-06-15 14:18:26 -0500', date_gmt: '2010-06-15 13:18:26 -0500', id: 28672}
- {author: lozzer, author_email: antwebid@gmail.com, author_url: '', content: "I completely\
    \ agree that Python is severely limited by its inability to deploy applications\
    \ to multiple platforms as a single file executable. I have been a long time user\
    \ of Perl and have enjoyed using ActiveState's PerlApp tool to do exactly that.\
    \ A few years back, PerlApp was very fiddly to use, but finally it became a very\
    \ simple process to deploy complex applications (e.g. with an embedded SQLite\
    \ database) on Win, Linux OS X.\r\n\r\nBut, as I'm now considering switching to\
    \ Python as my default language, I find this to be a major concern. Many Python\
    \ versions are *not* compatible with each other and so it is a major requirement\
    \ to deploy a completely standalone version. I've tried all the methods mentioned\
    \ above (except cxFreeze) and have found problems with each (e.g. fiddly settings,\
    \ non-compatibility with recent Python versions, etc..\r\n\r\nPerhaps there is\
    \ a good way to do this, but nobody has documented it fully yet. What we need\
    \ is for someone to create a site describing step-by-step how to deploy a simple\
    \ \"Hello World\" GUI app, in say WxPython or pyQT, to all the major operating\
    \ systems as a single executable file.\r\n\r\n*If* I can get some success, I'll\
    \ certainly do it myself, but I would love to hear if anybody else has already\
    \ done this. A long, long Google search has not been successful.", date: '2010-07-25
    10:34:14 -0500', date_gmt: '2010-07-25 09:34:14 -0500', id: 30436}
- {author: Tactoth, author_email: Tactoth@gmail.com, author_url: 'http://Tactoth.weebly.com',
  content: 'So this is exactly the same problem I''m expecting. I haven''t started
    programming in python, however I''m planning something with it. There are two
    main concerns here, the memory/execution time overhead and the deployment.


    As is tested by me, the performance of python is basically ok, and the memory
    overhead is less than that of JRE. Then it comes the deployment, which can really
    be annoying.



    I believe there are at least two things that should have been done by python officially,
    a compact "runtime distribution" (just like jre for jdk) and a official deployment
    tool... Hoowever neither of them actually exist so I take python as a custom software
    maker that requires large distribution.', date: '2010-09-28 01:49:39 -0500', date_gmt: '2010-09-28
    00:49:39 -0500', id: 33108}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Tactoth,\r\n\r\nObviously I sympathise with your concerns.\r\n\r\n\
    I don't know that a \"runtime distribution\" of Python would be any more compact\
    \ that what we're getting out of py2exe. It's 2Mb out of the box, including the\
    \ interpreter and all the standard libraries. Is there anything else that could\
    \ be omitted from this?\r\n\r\nAs for 'official tools' - I'm not sure how something\
    \ would be made 'official' - Python is a widespread community (possibly several\
    \ communities.) There are tools. How would they be made official? What difference\
    \ would that make?\r\n\r\nI understand it's muddlesome coming into all this from\
    \ the outside, clearly, I'm in the same boat.", date: '2010-09-29 13:59:44 -0500',
  date_gmt: '2010-09-29 12:59:44 -0500', id: 33200}
- {author: tactoth, author_email: tactoth@gmail.com, author_url: 'http://tactoth.weebly.com',
  content: "@Tartley\r\n\r\nHi tartley, my comments is a little bit not \"qualified\"\
    \ cuz i've not yet used py2exe, if that can really reduce the application size\
    \ to be around 2 mb, the deployment can really be much less a problem.\r\n\r\n\
    By \"official\" I mean in the distribution from python.org there should be some\
    \ sort of tools included. Take py2exe above for example, you never know whether\
    \ it'll be discontinued someday, that's a risk.", date: '2010-09-29 15:05:54 -0500',
  date_gmt: '2010-09-29 14:05:54 -0500', id: 33201}
- {author: '&Atilde;&laquo;RiC', author_email: eric@goodsoul.de, author_url: 'http://goodsoul.de',
  content: "he Jonathan! Just googled on this topic.\r\nI'm doing a Autohotkey tool\
    \ for the guys in our company and I had to use some kind of python too.\r\nI actually\
    \ deployed just python.exe and python26.dll along with the script and somehow\
    \ it worked! Now they changed something with the SVN in the network and at around\
    \ that time.. darn I really don't know what actually happened: it stopped working.\
    \ ( 'import site' failed; )\r\n\r\nNow I have to figure that out too :(\r\nA pity\
    \ its not that easy like with Autohotkey. rightklick in the explorer>compile\r\
    \nthats it! Autohotkey is surely not a beautiful language but it has some really\
    \ nice things on board that are easy to setup and just a huge timesaver..\r\n\
    I think I gonna try cx_Freeze now. Thanks for the link to Thierry Schork.", date: '2011-03-22
    18:12:21 -0500', date_gmt: '2011-03-22 18:12:21 -0500', id: 40425}
- {author: joran, author_email: joranbeasley@gmail.com, author_url: '', content: "its\
    \ really easy with pyinstaller\r\n\r\nc:\\pyinstaller\\pyinstaller.py  &#45;&#45;onefile\
    \ \"main_script.py\"\r\n\r\nand it makes a nice simple single executable that\
    \ includes all required packages and DLL's EXACTLY as they exist on the system\
    \ you build on...", date: '2013-06-26 22:28:45 -0500', date_gmt: '2013-06-26 21:28:45
    -0500', id: 84385}
date: 2009-09-28 13:26:45 -0500
date_gmt: 2009-09-28 12:26:45 -0500
layout: post
published: true
status: publish
tags: []
title: Python Deployment Sucks
wordpress_id: 843
wordpress_url: http://www.tartley.com/?p=843
---

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

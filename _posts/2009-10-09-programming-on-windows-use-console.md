---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software, MSWin-dev]
comments:
- {author: Jason R. Coombs, author_email: jaraco@jaraco.com, author_url: 'http://www.jaraco.com',
  content: I love Console. Too bad development has stalled on 64-bit development.
    I use 64-bit Vista and I'm chomping at the bit for a 64-bit version., date: '2009-10-09
    20:24:43 -0500', date_gmt: '2009-10-09 19:24:43 -0500', id: 23768}
- {author: Jason R. Coombs, author_email: jaraco@jaraco.com, author_url: 'http://www.jaraco.com',
  content: Console works great with Powershell. Ditch cmd.exe and use powershell!
    Windows 7 includes PowerShell 2., date: '2009-10-09 20:25:50 -0500', date_gmt: '2009-10-09
    19:25:50 -0500', id: 23769}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks Jason - You are, of course, absolutely right in all that you say.\
    \ I initially tried to include the use of alternate shells in this post. But it\
    \ started to become quite lengthy, and I'm really keen to try and keep each post\
    \ short enough for readers to be able to implement each one immediately, without\
    \ being intimidated by a lengthy procedure. So I saved talk of powershell and\
    \ cygwin, etc, for another day.\r\n\r\nI love your gravitar. Har har.", date: '2009-10-10
    11:26:53 -0500', date_gmt: '2009-10-10 10:26:53 -0500', id: 23783}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'People have mentioned Rxvt as another worthy contender. I quite agree
    - I used it happily for years. However, I chose to show Console here because,
    as I recall, rxvt is no longer being actively developed, and I judge that Console
    will be a bit less of an impedance mismatch for Windows sensibilities.', date: '2009-10-10
    16:42:09 -0500', date_gmt: '2009-10-10 15:42:09 -0500', id: 23791}
- {author: Michael Foord, author_email: michael@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com/',
  content: 'Well, where''s the next one in the series?? Have you been swanning off
    to sunny Philadelphia instead of writing blog entries?', date: '2009-10-27 23:44:59
    -0500', date_gmt: '2009-10-27 23:44:59 -0500', id: 24089}
date: 2009-10-09 18:18:50 -0500
date_gmt: 2009-10-09 17:18:50 -0500
layout: post
published: true
status: publish
tags: []
title: 'Programming on Windows : Use Console'
wordpress_id: 852
wordpress_url: http://www.tartley.com/?p=852
---

Developing software on Microsoft Windows is a bloody awful experience
compared to the boyish flamboyance of Macs or the mad scientist
thrill-a-minute of wrestling Linux into shape. But fear no more, you no
longer need to hide behind that fullscreen IDE, pretending that the rest
of your OS doesn't exist. Help is at hand.

I often feel that with just a dozen small modifications, the UI of
Microsoft Windows could be perfectly usable for me. However, successive
releases of Windows seem to steadfastly ignore the minor changes I'd
love to see. If anything, they move relentlessly in the opposite
direction with every release.

This is the first in a series of tweaks to work around some of these
deficiencies, to create something approaching a sane software
development environment on Windows. If you are a \*nix or command-line
jockey, this might make your visits to Windows-land more comfortable. If
you're a Visual Studio devotee, this might add some alternative tools to
your repertoire.

My idea is that each post will be small enough that you can implement
the change it suggests *immediately*, right now, as you're reading it.

**The Console**

The console, by which I mean the black DOS 'Command Prompt' window, is
the pivot around which the rest of your software development activities
rotate. Or at least it could be, if it was any good. The built-in
Command Prompt, however, is absolute garbage. Replace it with the
poorly-named 'Console' project from SourceForge:

<https://sourceforge.net/projects/console/>

Once installed, you could fiddle around with the settings endlessly, or
just copy my console.xml config to your home directory, after which
running Console should look something like the following:

\[caption id="" align="alignnone" width="46"
caption="console.xml"\][![console.xml (config for
Console)](http://tartley.com/wp-includes/images/crystal/text.png "text.png"){width="46"
height="60"}](http://tartley.com/wp-content/uploads/2009/10/console.xml)\[/caption\]

\[caption id="attachment\_868" align="alignnone" width="588"
caption="Console: It doesn't look like much"\]![Console: It doesn't look
like
much](http://tartley.com/wp-content/uploads/2009/10/mswindows-command-prompt.png "mswindows-command-prompt"){.size-full
.wp-image-868 width="588" height="279"}\[/caption\]

Console provides a few superficial benefits that prove to be
indispensable in everyday use:

-   Cut and paste is no longer an unimaginable pain in the ass. What a
    concept. My config automatically copies selected text to the
    clipboard, so you don't even need to hit Ctrl-C. Because of this,
    I've reverted the action of Ctrl-C to its more venerable usage of
    'kill the running command'.
-   Selecting text with the mouse now works sanely, although sadly you
    can't double/triple click to select words or lines.
-   Multiple tabs. My config defines keys: Ctrl-T (new), Ctrl-W (close),
    and Ctrl-tab (next).
-   PageUp and PageDown scroll, without needing to move your hand to the
    mouse. My config actually uses Shift-PageUp and Shift-PageDown, so
    that it's like old XTerms that my fingers apparently still remember.
-   We can choose any font. I like Deja Vu Sans Monospace, no doubt you
    like something totally different.
-   We can resize the window however we like.
-   Transparency. I don't like it, some people do. (**Update:**
    Redacted. I've been converted. Now [I love
    it](http://img177.yfrog.com/i/5cy.jpg/).)

The old built-in Command-Prompt will still pop up if you double-click a
.bat file - I don't know how to change this magic built-in association.
Otherwise though, you can now just use the new Console for everything
you do.

Alright. We've taken our first step. Next up, we'll see some of the uses
to which we can put our new toy.

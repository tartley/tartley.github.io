<!--
.. title: More Colored Terminal text on Windows: AnsiCon
.. slug: more-colored-terminal-text-on-windows-ansicon
.. date: 2010-07-08 14:07:09-05:00
.. tags: MSWin-dev
.. category: MSWin-dev
.. link: 
.. description: 
.. type: text
-->


A reminder for myself:

ANSI escape characters don't work properly in Windows terminals:

![Before: Raw ANSI codes. Not nice.](/files/2010/07/ansicon00-before.png)

To make them work properly, use
[AnsiCon](http://adoxa.110mb.com/ansicon/index.html). Unzip it somewhere
permanent (eg. `%ProgramFiles%\ansicon`) and install it with:

```
ansicon.exe -i
```

start a new terminal, and lo:

![After: Pretty.](/files/2010/07/ansicon01-working.png)

Fine tune the appearance of the programs generating the color, for
example customise 'hg diff' by editing \~/.hgrc:

``` yaml
[extensions]
color =

[color]
status.modified = yellow bold
status.unknown = white
status.deleted = red_background white bold

diff.deleted = red bold
diff.inserted = green bold
diff.file_a = white
diff.file_b = white
diff.diffline = white_background black
diff.extended = yellow bold
diff.hunk = underline black
diff.changed = yellow bold
```

![Fine-tuned](/files/2010/07/ansicon02-tuned.png)

ANSI is correctly stripped out if the output of a program is not a
terminal, so the colored output won't interfere with saving to files nor
machine-parsing of the text:

![Filtered](/files/2010/07/ansicon03-filtered.png)

Finally, insert some [ANSI
codes](http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html)
into your [prompt](http://ss64.com/nt/prompt.html), by setting
environment variable PROMPT:

```
set PROMPT=$E[0;36m$P$_$E[36;1m$G$E[0m$S
```

![Colored Prompt](/files/2010/07/ansicon04-prompt.png)

[Multiple](http://tartley.com/?p=1062)
[posts](http://tartley.com/?p=863) on colors and terminal text is
perhaps a bit obsessive of me. I think I'm all done now.
---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software, MSWin-dev]
comments:
- {author: Gerry King, author_email: gerry.king@thomsonreuters.com, author_url: '',
  content: "Have you considered 'Proggy Fonts'?\r\n\r\nhttp://www.proggyfonts.com/",
  date: '2010-01-25 15:28:38 -0600', date_gmt: '2010-01-25 15:28:38 -0600', id: 25647}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks for the suggestion Gerry, main post is updated to include a couple
    of Proggy fonts too.', date: '2010-01-26 19:11:05 -0600', date_gmt: '2010-01-26
    19:11:05 -0600', id: 25673}
- {author: undu, author_email: unduthegun@gmail.com, author_url: '', content: "To\
    \ fix inconsolata under cleartype you can try a modification for cleartype (haven't\
    \ tried it): http://pgl.yoyo.org/bits/files/inconsolata-modified.ttf\r\n\r\nOr\
    \ use an alternate font render such as gdipp (http://code.google.com/p/gdipp/)\
    \ which in my system makes inconsolata look like this: http://imgur.com/Fsaai.png",
  date: '2010-05-09 23:28:46 -0500', date_gmt: '2010-05-09 22:28:46 -0500', id: 27991}
- {author: Rahul, author_email: coldvaseline@gmail.com, author_url: '', content: '@undu
    - Many many thanks for suggesting modified inconsolata along with gdipp. That
    combination works like charm. I am so happy with my editor now and its all because
    of you. Thanks again!!', date: '2011-08-30 15:40:23 -0500', date_gmt: '2011-08-30
    14:40:23 -0500', id: 54589}
date: 2010-01-20 20:21:09 -0600
date_gmt: 2010-01-20 20:21:09 -0600
layout: post
published: true
status: publish
tags: []
title: My Fonts Look Crap. I blame Windows and ATI.
wordpress_id: 959
wordpress_url: http://tartley.com/?p=959
...
---

I know, I *know*. But I use Windows for 8 hours a day at work. So what
do you do?

Here's the poster-boy for programmer-friendly fonts, your friend and
mine, everyone loves him, **Inconsolata**:

(**Update:** Wordpress evidently has some javascript or CSS trickery
that squashes these images horizonally if your browser is narrow, to
make them fit in the window. Since I'm banging on about microscopic
differences between microscopic fonts, you'll need to click each images
to view them at precisely 100%)

[![inconsolata-11](http://tartley.com/wp-content/uploads/2010/01/inconsolata-11.png "inconsolata-11"){.size-full
.wp-image-960 .alignnone width="616"
height="335"}](http://tartley.com/wp-content/uploads/2010/01/inconsolata-11.png)

I don't know about you, but to me that looks unutterably crap. Wonky and
irregular. On the right of the orange line is what it looks like with
ClearType turned off. Meh. Presumably I'm doing it wrong, somehow, but
unless I figure out how, Inconsolata can fuck right off.

So then I fire up the trusty fallback, **Consolas**:

[![consolas-10](http://tartley.com/wp-content/uploads/2010/01/consolas-10.png "consolas-10"){.alignnone
.size-full .wp-image-961 width="616"
height="335"}](http://tartley.com/wp-content/uploads/2010/01/consolas-10.png)

This is better, certainly, but the letters look cramped. For the number
of visible lines in a window that size, the letters are awful small.
Again, on the right of the line is ClearType turned off - which in this
case distinctly worse.

So I continue peering at a succession of monospaced idiocy, eventually
ending up on **DejaVu Sans Mono**:

[![deja-vu-sans-mono-9](http://tartley.com/wp-content/uploads/2010/01/deja-vu-sans-mono-9.png "deja-vu-sans-mono-9"){.alignnone
.size-full .wp-image-962 width="616"
height="331"}](http://tartley.com/wp-content/uploads/2010/01/deja-vu-sans-mono-9.png)

This still isn't perfect, but it's the best I can find. Note that it
bears out my impression of Consolas being cramped - even though the
letters are substantially larger, we still manage to fit an extra line
of text in. This time, turning ClearType off (right of the line) makes
it a little crisper, and a little more wonky, but not much.

This isn't just in Vim. It looks like this in all applications. I've
tried running the [ClearType Tuning
Powertool](http://www.microsoft.com/typography/ClearTypePowerToy.mspx),
to no avail. Admittedly, all these fonts start to look a damn sight
better when I increase the size a few notches. But that's bugger all use
really, isn't it? Maybe I should be digging out some mono fonts designed
especially to be viewed at small sizes? Oooh, now that's actually not a
bad idea: How about those Android fonts everyone's banging on about?
**Droid Sans Mono:**

**[![droid-sans-mono-10](http://tartley.com/wp-content/uploads/2010/01/droid-sans-mono-101.png "droid-sans-mono-10"){.alignnone
.size-full .wp-image-964 width="616"
height="331"}](http://tartley.com/wp-content/uploads/2010/01/droid-sans-mono-101.png)\
**

This isn't bad, but does contain all the old 'zero vs upper-case O' and
'one versus lower-case L' ambiguities. I think I'll stick with DejaVu
Sans Mono.

Does Inconsolata work OK on Windows for everyone else?

**Update**: Gerry suggested trying out Proggy Fonts (thanks!). These are
bitmap fonts (unless you want to do without extended characters) so they
won't scale. Nevertheless, here's how some representative fonts from
there look. First up, **Proggy Clean slashed zero:**

[![proggy-clean-sz
font](http://tartley.com/wp-content/uploads/2010/01/proggy-clean-sz.png "proggy-clean-sz"){.alignnone
.size-full .wp-image-994 width="616"
height="325"}](http://tartley.com/wp-content/uploads/2010/01/proggy-clean-sz.png)

I love the crisp clarity of a pixel-perfect bitmap font with no scaling
or anti-aliasing. On the downside, I have a feeling that the characters'
shapes aren't quite as well-formed and beautiful as *DejaVu*. Not sure
whether or not this would bug me. Next up, **Proggy Opti:**

[![proggy-opti
font](http://tartley.com/wp-content/uploads/2010/01/proggy-opti.png "proggy-opti"){.alignnone
.size-full .wp-image-995 width="616"
height="331"}](http://tartley.com/wp-content/uploads/2010/01/proggy-opti.png)

Color me impressed. *Opti* still has the wonderful pixel-perfect clarity
of *Proggy Clean*, and manages to fit four extra lines of text into the
same sized window. Obviously in order to achieve this, the characters
are smaller than *Deja Vu*, but this is no bad thing. I would have liked
to scale Deja Vu down a tad from the size you see it above, but if I
try, the letters start to become a little distorted and indistinct. I
might well give Opti a spin for a few days, see how it wears on me.
Thanks for the suggestion Gerry!

![](file:///C:/DOCUME%7E1/jhartley/LOCALS%7E1/Temp/moz-screenshot.png)

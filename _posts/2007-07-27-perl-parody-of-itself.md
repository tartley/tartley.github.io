---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software]
comments:
- {author: A yen for more symbols, author_email: '', author_url: 'http://blog.wordaligned.org/articles/2007/09/13/a-yen-for-more-symbols',
  content: '[...] true: at one point Perl 6 used &#xa5; U+00A5 YEN SIGN for as a zip
    operator, for the excellent reason [...]', date: '2007-09-13 16:43:14 -0500',
  date_gmt: '2007-09-13 16:43:14 -0500', id: 3212}
- {author: 'tartley.com &raquo; Why Python?', author_email: '', author_url: 'http://tartley.com/?p=302',
  content: '[...] day of experimentation. The syntax is clean and concise, without
    too much cryptic punctuation (Perl, I&#8217;m looking at you), redundancy or unnecessary
    [...]', date: '2008-03-20 01:29:55 -0500', date_gmt: '2008-03-20 01:29:55 -0500',
  id: 9192}
date: 2007-07-27 13:35:12 -0500
date_gmt: 2007-07-27 13:35:12 -0500
layout: post
published: true
status: publish
tags: []
title: 'Perl: parody of itself'
wordpress_id: 197
wordpress_url: http://tartley.com/?p=197
---

Hey. I'm doing some Perl coding on the side. Who knows a good way to
interleave two lists? For example, combining (1, 3 ,5) and (2, 4, 6) to
produce ((1, 2), (3, 4), (5, 6)) ?


> It's easy, Perl has a built-in zip operator:
>
>     `my @result = (1, 3 ,5) ¥ (2, 4, 6)`

Brilliant, thanks. Hang on. What the crap!? Is that really a *Yen*
symbol in there? You have got to be shitting me. What. The. Crap.

> Ha! Yeah, I know, its a little weird, but since Perl supports source
> code unicode encodings, we thought "why not?" Typographically, it looks
> like a little zipper, you see? Geddit?

Right. I see that now. Um. So which unicode Yen symbol do I use?

    ¥ U+00A5 YEN SIGN
    ￥ U+FFE5 FULLWIDTH YEN SIGN

They both look the same in my browser. In fact, they both just look like
question-marks in many people's browsers.

> Oh, you can easily tell the difference - one of them simply won't work.
> Just try them both out until you find the one that works!!!! :-)

Right. Brilliant. And who is responsible for this gem?

> Oh, that was Larry. Look, if you don't like it, come to think of it,
> it's been renamed recently. The zip operator is now simply spelt 'Z'.

Yeah, whoever would have predicted that might happen? Guess who gets
their language designer privileges revoked? Morons. Get away from me,
before I get any stupid on me.


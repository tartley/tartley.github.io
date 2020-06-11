<!--
.. title: Perl: parody of itself
.. slug: perl-parody-of-itself
.. date: 2007-07-27 13:35:12-05:00
.. tags: Software
.. category: Software
.. link: 
.. description: 
.. type: text
-->


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

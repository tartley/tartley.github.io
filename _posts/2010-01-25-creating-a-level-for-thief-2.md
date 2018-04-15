---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Creative, Geek, GameDev]
comments:
- {author: Chris DeLeon, author_email: chris@deleonic.com, author_url: 'http://cdgdl.com/?page=about',
  content: "Looking good! Your listing of 3 reasons for picking this old engine/game\
    \ in particular are especially succinct and widely applicable selection criteria.\
    \ I&acirc;&euro;&trade;ll likely point next month&acirc;&euro;&trade;s readers\
    \ to this page as an example of what to look for when digging into their first\
    \ experience modding.\r\n\r\nYou mentioned a couple of other details via e-mail\
    \ that might be helpful as pointers or discussion topics to others, too: not letting\
    \ writer&acirc;&euro;&trade;s block on story hold up level creation (experience\
    \ building levels will inevitably help in writing level stories, like how experience\
    \ in game programming helps in designing with programming in mind), suggestions\
    \ of what process optimizations level design might learn from the Geographic Information\
    \ Systems industry, focusing on a single emotion and a couple of &acirc;&euro;&oelig;moments&acirc;&euro;\x9D\
    \ in the level&acirc;&euro;&trade;s design, etc.\r\n\r\nI thought your suggestion\
    \ of how level design might benefit from GIS techniques was particularly interesting,\
    \ since creative industries have a lot to gain from learning what we can off the\
    \ business/engineering die-hard fields. Pitch tuning, which has made T-Pain and\
    \ Lady GaGa, apparently was derived from technology that ocean oil tycoons used\
    \ to adjust sonar frequencies to local conditions when scouring the ocean floor\
    \ for potential oil drilling locations. You may be new to level design, but you&acirc;&euro;&trade;re\
    \ not new to computer work, and you have valuable knowledge from your own experiences\
    \ that the rest of us don&acirc;&euro;&trade;t (!).\r\n\r\n[edit - fixed a typo\
    \ or two. Please delete my previous post]", date: '2010-01-26 01:03:41 -0600',
  date_gmt: '2010-01-26 01:03:41 -0600', id: 25661}
- {author: Queue, author_email: taffer_queue@yahoo.com, author_url: '', content: 'Looking
    good!  Make sure you head on over to the Editor''s Guild (http://www.ttlg.com/forums/forumdisplay.php?f=85)
    for all that is Dromed.', date: '2010-01-28 03:17:35 -0600', date_gmt: '2010-01-28
    03:17:35 -0600', id: 25701}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks very much Queue, I''ll add it to my RSS feeds.', date: '2010-01-28
    08:51:36 -0600', date_gmt: '2010-01-28 08:51:36 -0600', id: 25710}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Nice discussion here: http://www.ttlg.com/forums/showthread.php?t=130794',
  date: '2010-01-28 08:58:52 -0600', date_gmt: '2010-01-28 08:58:52 -0600', id: 25711}
- {author: Qolelis, author_email: mazqin@hotmail.com, author_url: '', content: "It's\
    \ always nice to see new people using DromEd :)\r\n\r\nBy the way:\r\nA tip is\
    \ to rotate the front texture of each step 90 degrees.", date: '2010-01-28 16:57:02
    -0600', date_gmt: '2010-01-28 16:57:03 -0600', id: 25720}
- {author: clearing, author_email: ejay@mail.ru, author_url: 'http://darkfate.ru',
  content: ':) Keep up the good work!', date: '2010-01-29 08:42:39 -0600', date_gmt: '2010-01-29
    08:42:39 -0600', id: 25730}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks Qolelis and clearing, encouragement much appreciated, and your
    specific tip about staircase textures especially so.', date: '2010-02-01 13:19:50
    -0600', date_gmt: '2010-02-01 13:19:50 -0600', id: 25783}
- {author: Jason Otto, author_email: Ottoj55@hotmail.com, author_url: 'http://JasonOtto.net',
  content: 'Be aware, I''m changing the file structure at my site, those tutorials
    will be moving shortly.  A useful command for you is texture_change X,Y where
    X is the number of the first texture, and Y the one you want it to become, it''ll
    globally replace a texture you don''t like.', date: '2010-03-26 20:51:49 -0500',
  date_gmt: '2010-03-26 20:51:49 -0500', id: 26982}
date: 2010-01-25 13:50:26 -0600
date_gmt: 2010-01-25 13:50:26 -0600
layout: post
published: true
status: publish
tags: []
title: Creating a Level for Thief 2
wordpress_id: 958
wordpress_url: http://tartley.com/?p=958
---

After [Sinister Ducks](http://tartley.com/?p=956), my [videogame
creation mentor](http://www.gamedevlessons.com/) suggested that I create
a mod for an existing game, in order to distance myself a little from
the programming aspects of creating a game, and instead spend a little
time considering the gameplay and the art and the music from the
perspective of the user. Sounds like useful advice.

So, the last couple of weeks I've been working through the
[tutorials](http://www.jasonotto.net/tutorials/CompleteTut.htm) for
[DromEd](http://en.wikipedia.org/wiki/DromEd), the notoriously cranky
level editor for vintage sneak-em-up [Thief: The Dark
Project](http://en.wikipedia.org/wiki/Thief:_The_Dark_Project).
(Specifically for the sequel, [Thief 2: The Metal
Age](http://en.wikipedia.org/wiki/Thief_II:_The_Metal_Age), which has a
slightly improved engine and editor.) I chose this for three reasons:

1.  Released in 1998, *Thief* is old enough that the assets are simple
    [low-fidelity geometry and
    bitmaps](http://www.mobygames.com/game/windows/thief-ii-the-metal-age/screenshots/gameShotId,7666/).
    These are easy enough for me to create and edit, plus if I
    intersperse existing game assets with my own shoddy creations, there
    won't be a tremendously jarring disparity in apparent quality.
2.  Even though *Thief* is ten years old and the company that created it
    long gone, there's still [a thriving
    community](http://www.ttlg.com/) of amateur afficionados, churning
    out [new
    missions](http://www.ttlg.com/forums/showthread.php?p=1508201) at
    the rate of several per month, many of which are of exceedingly high
    quality - in some cases exceeding that of the original game. I'll be
    in good company, will have some meaningful feedback, and will have
    forums to turn to when I get into difficulties.
3.  Last but not least, *Thief* is one of my favourite games of all
    time. The emphasis on sneaking around and avoiding confrontation
    suits my sensibilities. Your protagonist, Garrett, is a marvellous,
    mercenary character. Best of all, in *Thief 1*, it reveals
    unexpected depth halfway through - the player's expectations of a
    succession of simple heists takes a strange twist when the powerful
    storyline reveals itself.

Having finished the tutorials, this weekend I broke ground on creating
my own level, or 'fan-mission' (FM), in the parlance:

[![Designing a Thief2 Level in
DromEd](../wp-content/uploads/2010/01/dromed-sm.png "dromed-sm"){width="643"
height="502"}](../wp-content/uploads/2010/01/dromed-sm.png)

I'm using the DromEd Toolkit, which is DromEd with some third-party
patches and bugfixes applied to it. My first impressions with DromEd are
that it's very clunky and ugly, and startlingly lacking in
documentation. I've taken to dipping into the configuration files to see
what keyboard commands exist to experiment with. There are a bewildering
variety of binary patches to modify the executable in various exciting
ways, and forum posts about it, although helpful and prolific, seem
fragmentary and rife with broken links. I've still no idea whether I
ought to be using *Dromed Delux* instead, nor where I should get that
from. It's a glorious chaotic riot, and it's a little intimidating.

Still, having said that, the binary patches have all worked fine for me,
and the more I use the editor, the more it's starting to grow on me.

I'm setting my FM in a museum. There's already an existing museum
mission out there, but as opposed to its marble-halled austerity, I'm
imagining this will be more like the cramped, cosy, wood-panneled
chaotic collection of something like the wonderful [Sir John Soane's
Museum](http://www.britishtours.com/360/soane-museum.html) in London.

So progress as of week 1 looks like this: I've carved out some very
basic geometry to form a stocky museum building. Here you can just about
make out a hole in the brick facade that will form the front entrance.
This is not the entrance that the player will likely be using:

[![](http://tartley.com/wp-content/uploads/2010/01/front-entrance.jpg "front-entrance"){.alignnone
.size-full .wp-image-991 width="640"
height="480"}](http://tartley.com/wp-content/uploads/2010/01/front-entrance.jpg)

This is all very crude thus far - with repeating textures on large
surfaces, and plain uniform lighting. There are a complete set of mostly
rectangular ground-floor rooms, with interconnecting doorways. The
highlight of my modelling to date is this stairway leading up to the
(otherwise nonexistant) next floor.\
[[****]{style="font-family: verdana,arial,helvetica,sans-serif; font-size: xx-small;"}]{style="font-family: verdana,arial,helvetica,sans-serif;"}

[![](http://tartley.com/wp-content/uploads/2010/01/stairway.jpg "stairway"){.alignnone
.size-full .wp-image-992 width="640"
height="480"}](http://tartley.com/wp-content/uploads/2010/01/stairway.jpg)

I'm not so happy with the wood texture I chose - I'll go back and look
for something more uniform. But I am happy with the way the stairs flair
out at the bottom. I realised in the process of creating this that this
makes it possible to fit a flight of stairs into a smaller space than
would otherwise be possible, by allowing the bottom few steps to
gracefully project out into the corridor.

Having finished this last night, I then dreamed about geometric
operations on three dimensional spaces, which I think is a good sign.

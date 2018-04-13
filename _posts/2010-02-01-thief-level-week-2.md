---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, GameDev]
comments:
- {author: David Jones, author_email: drj@pobox.com, author_url: 'http://drj11.wordpress.com/',
  content: 'You can get paper with a blue isometric grid drawn on for doing your isometric
    sketches you know.  Not easily or cheaply last time I looked, but that was about
    22 years ago.', date: '2010-02-01 14:11:52 -0600', date_gmt: '2010-02-01 14:11:52
    -0600', id: 25784}
- {author: David Jones, author_email: drj@pobox.com, author_url: 'http://drj11.wordpress.com/',
  content: 'PS.  Yes, I like your hand drawn and scanned in designs. :)', date: '2010-02-01
    14:12:27 -0600', date_gmt: '2010-02-01 14:12:27 -0600', id: 25785}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Brilliant! Genius idea David, I know just where to get some. Thanks!',
  date: '2010-02-01 22:35:16 -0600', date_gmt: '2010-02-01 22:35:16 -0600', id: 25796}
- {author: Chris DeLeon, author_email: chris@gamedevlessons.com, author_url: 'http://www.cdgdl.com/?page=about',
  content: "Looking good!\r\n\r\nSince your updates seem to both be centered (from\
    \ opposite directions) on scope, I'd offer my two cents that I think you've done\
    \ a really good job in identifying an appropriate starting challenge.\r\n\r\n\
    On the one hand, you're not just building two rooms connected by a hallway with\
    \ some items to grab or enemies to fight - you're putting together a genuine building\
    \ with guards to avoid, multiple points of entry, and adequate intricacy to attach\
    \ a light narrative to the gameplay. You're clearly not just getting experience\
    \ with the level editor, but (importantly) getting experience with using the level\
    \ editor *to build a Thief level*.\r\n\r\nOn the other hand, it isn't hopelessly\
    \ ambitious, either. The amount to be done can be enumerated and time estimated,\
    \ which is a good sign; for console games of full commercial scope, there are\
    \ people who devote 100% of their time to managing that task. There's also room\
    \ to cut scope if needed, either by chopping a few details on how the player could\
    \ enter, skimping on guard density if it proves to be problematic when tuning\
    \ difficulty, or getting lazy and taking shortcuts with the lighting (by thinking\
    \ practically, like an industrial architect, instead of dramatically, like a set\
    \ designer).\r\n\r\nThe outside world tends to favor simple things done well than\
    \ grandiose things poorly executed, which are the two options while learning a\
    \ technology and working on unpaid time. Big things well executed generally means\
    \ the tech/tools need to be second nature at the time of production, and that's\
    \ also the space where, going into it alone, you start to risk being compared\
    \ unfavorably to what big companies can do with their resources instead of being\
    \ compared favorably to what other indies are able to do (also) for free.\r\n\r\
    \nHaving experimented with iso grid paper before, I've tended to prefer freehanding\
    \ on blank pages for this sort of purpose. The function of the sketches is more\
    \ about the concept and connectivity/spatial relationships, which can be iterated\
    \ on more easily when attention isn't caught up in making sure lines meet up.\
    \ It's easier to \"squeeze in\" another idea or note on a freehand drawing without\
    \ remaking the whole sketch. (I have enjoyed using grid paper for tile-based game\
    \ maps though.)\r\n\r\nI think that the main challenge going forward is going\
    \ to be adjusting expectations about the pace of building. It's like how a real\
    \ building begins as a hole in the ground for foundation, some concrete gets poured,\
    \ and then the steel infrastructure and walling springs up rather quickly... but\
    \ then there's a mysterious amount of time before it's ready, since the detail\
    \ work isn't as massively visible part-for-part. You clearly have a sense of how\
    \ to pace and type of work to be done given your prepared todo list, I'm just\
    \ sharing a word of warning to steel yourself against possibly feeling discouraged\
    \ if the remaining level work doesn't feel like it's moving along as quickly as\
    \ brushing out the geometry did. It's not supposed to move along as quickly, so\
    \ if it feels that way despite putting consistent time into it, you're probably\
    \ doing it right. :)", date: '2010-02-03 00:12:58 -0600', date_gmt: '2010-02-03
    00:12:58 -0600', id: 25834}
- {author: Winky McDougal, author_email: winky@mailinator.com, author_url: '', content: testing
    'email me any new comments' plugin, date: '2010-02-05 12:08:29 -0600', date_gmt: '2010-02-05
    12:08:29 -0600', id: 25889}
- {author: Dinky McDougal, author_email: dinky@mailinator.com, author_url: '', content: here's
    the test test test, date: '2010-02-05 12:08:53 -0600', date_gmt: '2010-02-05 12:08:53
    -0600', id: 25890}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: test the third, date: '2010-02-05 13:47:01 -0600', date_gmt: '2010-02-05
    13:47:01 -0600', id: 25893}
date: 2010-02-01 13:20:31 -0600
date_gmt: 2010-02-01 13:20:31 -0600
layout: post
published: true
status: publish
tags: []
title: 'Thief Level : Week 2'
wordpress_id: 1002
wordpress_url: http://tartley.com/?p=1002
...
---

This week I spent a little while considering the backstory of the level,
and now have at least a rudimentary scenario: Garrett the thief is
taking an opportunistic foray into the local Shope of Curiosities,
having heard that their prize exhibit, the McGuffin of Antioc, has been
removed from its high-security public display, in order to be cleaned or
maintained somewhere on-site.

On top of this, I've been refining the layout of the museum building,
starting with the two-storey entrance hall, complete with a balcony
running round it:

[![sketch of museum's two-storey main entrance
hall](http://tartley.com/wp-content/uploads/2010/02/w02-sketch-entrance.jpg "w02-sketch-entrance"){.alignnone
.size-full .wp-image-1003 width="623"
height="416"}](http://tartley.com/wp-content/uploads/2010/02/w02-sketch-entrance.jpg)

Plus, I've been planning the possible routes a thief might take to get
from one room to another. Generally, the conventional paths - in through
the main entrance and up the stairs and down the corridor - will be
blocked by guards. So the player has to clamber up the outside of the
building, explore the roof, dangle from a rope, pick a lock, find a key
in the janitor's quarters, which opens all the windows, and ledges
outside a couple of windows lead somewhere interesting, etc.Â  I don't
want it to turn into a key fetch quest, but at the same time, I don't
want the player to be able to simply waltz all through the whole
building. I've tried to engineer a single interesting primary route
through the building, with the possibility of a few minor variations so
players feel like they can exercise some freedom and decision making.

[![sketch of ground
floor](http://tartley.com/wp-content/uploads/2010/02/w02-sketch-ground-floor.jpg "w02-sketch-ground-floor"){.alignnone
.size-full .wp-image-1005 width="669"
height="444"}](http://tartley.com/wp-content/uploads/2010/02/w02-sketch-ground-floor.jpg)

Having done all that, I'm now quite happy that my plans are sufficient
to produce a small but adequate level. I'll aim to get that complete,
and any fancy window dressing I can layer on top will be a bonus.

I completed the modelling of all the rooms in the building, and
doorframes inbetween them. I applied some quick floorboard textures to
differentiate the floors and ceilings from the walls. Here you can see
the view from the main entrance, looking into the two-storey entrance
hall, with the balcony around it visible up on the next level:

[![main entraince with
floorboards](http://tartley.com/wp-content/uploads/2010/02/w02-main-entrance.jpg "w02-main-entrance"){.alignnone
.size-full .wp-image-1006 width="640"
height="480"}](http://tartley.com/wp-content/uploads/2010/02/w02-main-entrance.jpg)

And the view while approaching the top of the stairs, looking down over
the balcony. There will be a railing when it's done:

[![Approaching the top of the
stairs](http://tartley.com/wp-content/uploads/2010/02/w02-top-of-stairs-balcony.jpg "w02-top-of-stairs-balcony"){.alignnone
.size-full .wp-image-1007 width="640"
height="480"}](http://tartley.com/wp-content/uploads/2010/02/w02-top-of-stairs-balcony.jpg)

Thanks heaps to Qolelis for a comment with a tip about textures on
stairways, to rotate the texture 90 degrees on each stair's vertical
rise. I only just saw that, but will definitely apply it this week.

**Update**: I feel a bit self-concious that I'm creating the bare
minimum that could qualify to be a Thief level. There is not yet a
lively, engaging backstory to the level, complete with colorful
characters, cleverly intertwined with the canon of the original game.

Similarly, the mechanical contents of my level are as simple as
possible. I haven't stretched myself, thinking of imaginative locations
or motives for Garrett to explore. I do not plan to have any clever
special objects or custom scripting in my level, defining dramatic
changing mission objectives as the player reveals new information. It's
a very straightforward 'get into a building, steal the loot, and get
out'.

Partly this is very deliberate - I want the level to be as minimal as it
can possibly be, so as keep it achievable. But also, this is partly in
response to my feeling that being creative is hard, especially when
under pressure. Right now I feel as though I have enough to worry about
just getting to grips with the minutia of the level editor. I almost
feel as if I need to become comfortable with that before I can relax
enough to get creative with it.

This isn't entirely unexpected. Clearly one cannot do great work on
one's first attempt. But at the same time, I don't want to just 'give
up' on the creative aspects. I want to do as good a job as I can do,
under the constraints of a small, straightforward 'first time' level
done in a reasonable timeframe. So maybe I just need to keep iterating.
Embelish the dramatic backstory little by little, see what occurs to me
as I go on. Look for some flash of inspiration as I bury myself in the
process. Fair enough. Baby steps.

**Update 2:** I created a quick TODO list, as a first approximation of
how much work there is to be done. I ended up with a list of 67
mandatory items (eg. Add doors inside each door frame; First pass at
lighting; Add balcony railing.) In addition I have 18 optional items
(eg. Add carpets and rugs; Hide moss arrows in the garden; Entrance hall
main exhibit.) The screenshots above represent about six completed items
(eg. Dromed tutorials; first floor rooms; doorways and arches between
rooms; staircase.) So at the current rate, it's roughly 28 weeks of
work, which is double or triple what I'd planned on. Hopefully my rate
of completing items will increase substantially as I get into the
groove. I'll have to monitor this going forward, and slash scope if I
can't drastically accelerate.

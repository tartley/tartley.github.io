<!--
.. title: Sinister Redux
.. slug: sinister-redux
.. date: 2010-01-09 15:57:47-06:00
.. tags: python,graphics
.. link: 
.. description: 
.. type: text
-->


A few months ago, [Glenn](http://millenniumhand.co.uk/) and
[Christian](http://www.babbageclunk.com/) and
[Menno](http://freshfoo.com) and myself created *Sinister Ducks*, a game
with some quacking, for [PyWeek 9](http://www.pyweek.org/9/), a contest
to write a game in Python in a week. It plays a little like a simplified
version of the arcade classic
[Joust](http://en.wikipedia.org/wiki/Joust_%28video_game%29) - press
fire to flap. When birds collide, the highest one wins, while the lowest
one sheds feathers and plummets to the ground.

Since the competition, I've been polishing and refactoring for my own
edification in odd hours here and there, and I'm pleased to declare that
process finished. Behold, Sinister Ducks 1.0.2:

![Sinister Ducks 1.0.2](https://raw.githubusercontent.com/tartley/sinister-ducks/master/docs/screenshots/screenshot-final-1.0.2.jpg "Sinister Ducks 1.0.2")

Things I added since the competition include:

-   Fixed the game being so ridiculously easy that one could play it
    interminably
-   There are now lives, and an actual Game Over screen and everything
-   Completely reworked how the gameplay works in regard to attacking
    ducks and collecting feathers - our previous mechanic didn't work
    very well. The feathers now temporarily boost a score multiplier,
    displayed top-left. Attacking other birds yields more points for
    successful chained consecutive attacks, without collecting any
    feathers along the way. But you can only *get* feathers in the first
    place by attacking birds. It's your job to figure out the resulting
    best-scoring dynamic.
-   Understand and enjoying the scoring dynamic is aided with little
    floating numbers showing the value of each bird you defeat.
-   Enemy birds now come in larger waves as time goes on, and one or two
    of the sinister ducks are angry and *fast*.
-   The game speed is now scaled by the time between refreshes, so it
    now runs perfectly fine on slow machines or VMs that can't make
    60fps, or if your monitor has an unusual refresh rate, or even if
    you disabled vsync in your graphics drivers to yield hundreds of
    frames per second.
-   Refactoring and OpenGL performance fixes (those sprites are
    texture-mapped quads, under the covers.) so that it's now massively
    faster than it should ever need to be. The refresh rate with vsync
    disabled on my own 5 year old lappy is about 400fps.

Repo at <https://github.com/tartley/sinister-ducks/>.

From there, you can download a Windows 'release' to download, unzip and
double-click, without having to mess about installing Python first. Or a
source release, which will run on Linux or Macs, but you'll have to
download Python yourself, and possibly install the dependencies manually
too, sorry.
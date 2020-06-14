<!--
.. title: Sole Scion project v0.1 : A 2D rigid-body Python game
.. slug: sole-scion-project-v01-a-2d-rigid-body-python-game
.. date: 2008-06-18 06:37:17-05:00
.. tags: games,python,2d,rigid body,physics,graphics,chipmunk,pymunk,pyglet,python,graphics
.. link: 
.. description: 
.. type: text
-->


![screenshot Sole Scion
v1.0](/files/2008/06/screenshot-sole-scion-v10.png)

[Everyone](http://sethgodin.typepad.com/seths_blog/2008/06/is-it-worthy.html)
today is [abuzz](http://www.codinghorror.com/blog/archives/001134.html)
with the 'release early, release often' sentiment, so I've decided to
get in the spirit and upload the first iteration of 'Sole Scion', my
summertime sabbatical game project.

Version 0.1 merely bounces some circles off an inclined plane
(pictured.) I aim to transform this into a 2D graphical adventure game,
in which I hope emergent fun will take place, once I populate the world
with enough twisty corridors, uniquely-shaped objects that need slotting
into the right places, and judicious instances of ornery fauna to
contend with.

It's written in Python, using
[Chipmunk](http://wiki.slembcke.net/main/published/Chipmunk) for rigid
body Newtonian dynamics, with Python bindings using
[Pymunk](http://code.google.com/p/pymunk/). Rendering, gameloop, sounds,
etc are handled by [pyglet](http://pyglet.org).

[Sole Scion is hosted on Google
Code](http://code.google.com/p/sole-scion), with Subversion read-access
and a source code tarball, including the redistributables for the above
dependencies, should anyone be curious. It has a [New BSD
License](http://www.opensource.org/licenses/bsd-license.php).

Feedback, thoughts and ideas, very welcome.

**Update**: I've only run it on Linux, but reportedly it also works on
Windows. Thanks Xtian!

**Update:** It also reportedly works under PyPy, provided you install
the 'functools' module. Thanks Maciej!
